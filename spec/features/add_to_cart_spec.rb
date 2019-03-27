require 'rails_helper'

RSpec.feature "add_to_cart button is clicked", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    
    @category.products.create!(
      name:  "Cool Shirt",
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "Cart size in nav bar increases by 1 on button press" do
    
    visit root_path
    expect(page.has_css?('a', text: 'My Cart (0)')).to eq true
    click_on 'Add'
    expect(page.has_css?('a', text: 'My Cart (1)')).to eq true

  end
end