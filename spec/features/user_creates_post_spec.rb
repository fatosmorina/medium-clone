require 'rails_helper'

RSpec.describe 'Creating post' do
  scenario 'successfully' do
    visit root_path
    click_on 'Write an article'

    fill_in 'Title', with: 'Introduction'
    fill_in 'Body', with: 'Introduction'
    click_on 'Publish'

    expect(page).to have_content 'Introduction'
  end

  scenario 'unsuccessfully' do
    visit root_path
    click_on 'Write an article'

    fill_in 'Title', with: 'An alternative approach'
    fill_in 'Body', with: ''
    click_on 'Publish'

    expect(page).to have_css '.error'
  end

end