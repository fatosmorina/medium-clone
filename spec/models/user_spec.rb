require 'rails_helper'

RSpec.describe User do
	

	describe 'following and unfollowing other users' do
	  let(:filan) { create(:user, username: 'Filan Fisteku')}
	  let(:solo){ create(:user, username: 'Ben Doe') }	

	  it 'follows and unfollows a user' do
	  	filan.follow(solo)
	  	expect(filan.following?(solo)).to be_truthy
	  	
	  	filan.unfollow(solo)
	  	expect(filan.following?(solo)).to be_falsy
	  end
	 
	end

end
