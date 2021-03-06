class Admin::CategoriesController < ApplicationController
  ActionController::Base.http_basic_authenticate_with name: ENV["ADMIN_NAME"], password: ENV["ADMIN_PASSWORD"]
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
  
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def index
    @categories = Category.order(id: :desc).all
  end

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end