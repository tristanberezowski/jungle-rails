class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @line_items = @order.line_items 
    @items = [] #this is the array of purchased products
    @total = 0;
    @user = :current_user

    @order.line_items.each do |item|
      @items << [Product.find(item.product_id), item]
      @total = @total + item.total_price_cents / 100.00
    end

  end

  def create
    charge = perform_stripe_charge
    order  = create_order(charge)
    @order = order

    if order.valid?
      empty_cart!
      redirect_to order, notice: 'Your Order has been placed.'
      Emailer.order_receipt(@order).deliver
    else
      redirect_to cart_path, flash: { error: order.errors.full_messages.first }
    end

  rescue Stripe::CardError => e
    redirect_to cart_path, flash: { error: e.message }
  end

  private

  def empty_cart!
    # empty hash means no products in cart :)
    update_cart({})
  end

  def perform_stripe_charge
    @user = current_user
    Stripe::Charge.create(
      source:      params[:stripeToken],
      amount:      cart_subtotal_cents,
      description: "#{@user.first_name} #{@user.last_name}'s Jungle Order",
      currency:    'cad'
    )
  end

  def create_order(stripe_charge)
    order = Order.new(
      email: params[:stripeEmail],
      total_cents: cart_subtotal_cents,
      stripe_charge_id: stripe_charge.id, # returned by stripe
    )

    enhanced_cart.each do |entry|
      product = entry[:product]
      quantity = entry[:quantity]
      order.line_items.new(
        product_id: product.id,
        quantity: quantity,
        item_price: product.price,
        total_price: product.price * quantity
      )
    end
    order.save!
    order
  end

end
