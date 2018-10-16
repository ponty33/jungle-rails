require 'rails_helper'

RSpec.feature "Add product to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "They see product details" do
    # ACT
    visit root_path

    first('article.product').find_button('Add').click


    # DEBUG
    # save_screenshot

  end


end
