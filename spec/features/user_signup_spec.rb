require 'rails_helper'

RSpec.feature 'User signing up' do

    scenario 'successfully' do
      visit new_user_registration_path
      fill_in 'Username', with: 'Username'
      fill_in 'Email', with: 'email@email.com'
      fill_in 'Password', with: 'qwerty123'
      fill_in 'Password confirmation', with: 'qwerty123'
      click_on 'Sign up'

      expect(page).to have_content('email@email.com')
    end

    scenario 'unsuccessfully' do
      visit new_user_registration_path
      fill_in 'Email', with: 'email@email.com'
      fill_in 'Password', with: ''
      fill_in 'Password confirmation', with: ''

      click_on 'Sign up'
      expect(page).to have_content('error')
    end

end