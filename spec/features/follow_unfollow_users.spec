require 'rails_helper'

RSpec.feature 'Following/Unfollowing users' do

	let(:filan) { create(:user) }
	let(:solo) { create(:user, username: 'Ben Doe') }

	scenario 'signed-in user can follow and unfollow other users' do
		sign_in filan
		visit user_path(solo)
		click_on "Follow"

		expect(page).not_to have_button('Follow')
		expect(page).to have_button('Unfollow')
	

		click_on 'Unfollow'
		expect(page).not_to have_button('Unfollow')

	end


end 