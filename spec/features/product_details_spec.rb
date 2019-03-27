require 'rails_helper'

RSpec.feature "Visitor clicks on a product to show it", type: :feature, js: true do

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
    @category.products.create!(
      name:  "Bad Shirt",
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "Shows only the one product" do
    visit root_path
    click_on 'Cool Shirt'

    # commented out b/c it's for debugging only
    # save_and_open_screenshot

    expect(page.has_css?('dd', text: 'Cool Shirt')).to eq true
    expect(page.has_css?('dd', text: 'Bad Shirt')).to eq false

  end
end