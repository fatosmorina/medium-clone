require 'rails_helper'

RSpec.describe 'Creating post' do
  let(:user) { create(:user) }

  scenario 'successfully' do
    visit root_path
    click_on 'Write an article'

    fill_in 'Title', with: 'Introduction'
    fill_in 'Body', with: 'Introduction'
    click_on 'Publish'

    within('.posts') do
      expect(page).to have_content('Introduction')
      expect(page).to user.username
    end
  end

  scenario 'unsuccessfully' do
    sign_in user
    visit root_path
    click_on 'Write an article'

    fill_in 'Title', with: 'An alternative approach'
    fill_in 'Body', with: ''
    click_on 'Publish'

    expect(page).to have_css '.error'
  end

  scenario ' non-logged in user cannot create a new article' do
    visit root_path
    click_on 'Write an article'
    
    expect(current_path).to eq(new_user_session_path)
  end

end