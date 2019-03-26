require 'rails_helper'

RSpec.describe Product, type: :model do

  before :each do
    @category = Category.create!(name: "nuts")
    @product = Product.new(name: "walnut", price: 150, quantity: 7, category: @category)
  end
  
  describe 'Validations' do

    it "saves a new product with name, price, quantity, and category present" do
      expect(@product.save!).to eq true
    end

    it "fails to save with no name" do
      @product.name = nil
      expect(@product).to_not be_valid
    end

    it "fails to save with no price" do
      @product.price_cents = nil
      expect(@product).to_not be_valid
    end

    it "fails to save with no quantity" do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end

    it "fails to save with no category" do
      @product.category = nil
      expect(@product).to_not be_valid
    end

  end

end
