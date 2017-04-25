require 'rails_helper'

RSpec.describe User do
	

	describe 'following and unfollowing other users' do
	  let(:filan) { create(:user, username: 'Filan Fisteku')}
	  let(:ben){ create(:user, username: 'Ben Doe') }	

	  it 'follows and unfollows a user' do
	  	expect(filan).not_to be_following(ben)

	  	filan.follow(ben)
	  	expect(ben.followers).to include(filan)
	  	
	  	filan.unfollow(ben)
	  	expect(filan.followers).not_to include(filan)
	  end
	 
	end

end
