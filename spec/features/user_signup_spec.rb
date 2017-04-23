require 'rails_helper'

RSpec.feature 'User signing up' do

    scenario 'successfully' do
      visit new_user_registration_path
      fill_in 'Email', with: 'email@email.com'
      fill_in 'Password', with: 'qwerty123'
      fill_in 'Password confirmation', with: 'qwerty123'
      click_on 'Sign up'

      expect(page).to have_content('email@email.com')
    end

    scenario 'successfully' do

    end

end