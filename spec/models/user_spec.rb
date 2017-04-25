require 'rails_helper'

RSpec.describe User 
	

	describe 'following and unfollowing other users' do
	  let(:filan) { create(:user, username: 'Filan Fisteku')}
	  let(:solo){ create(:user, username: 'Ben Doe') }	

	  it 'adds relationships between two users' do
	  	filan.follow(solo)
	  	expect(filan.following?(solo)).to be_truthy

	  	filan.unfollow(solo)
	  	expect(filan.following?(solo)).to be_falsy
	end	
end
