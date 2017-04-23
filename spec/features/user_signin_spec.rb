require 'rails_helper'

RSpec.describe 'User signing in' do
  
  background do
    @user = User.create!(email: 'email@email.com', password: 'password', password_confirmation: 'password')
  end
  
  scenario 'successfully' do
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Sign in'
  end

  scenario 'unsuccessfully' do

  end
  
end