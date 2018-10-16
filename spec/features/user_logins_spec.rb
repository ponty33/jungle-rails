require 'rails_helper'

RSpec.feature "Navagate product details", type: :feature, js: true do

  before :each do

    User.create!(
      name: 'name', 
      email: 'abcd@abcd.com', 
      password: 'abcdefgh', 
      password_confirmation: 'abcdefgh'
    )
  end

  scenario "User login" do
    # ACT
    visit '/login'

    within 'form' do
      fill_in id: 'email', with: 'abcd@abcd.com'
      fill_in id: 'password', with: 'abcdefgh'

      click_button 'Submit'

    end
    # DEBUG
    sleep 3
    save_screenshot
    

  end

end
