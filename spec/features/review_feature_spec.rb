require 'rails_helper'

describe 'review' do
	before do
		@restaurant = Restaurant.create(name: "Gardeners Arms")
	end

	it "adds the user's review" do
		visit '/restaurants'
		click_link 'Review Gardeners Arms'
		fill_in 'Content', with: "Awesome"
		select '5', from: 'Rating'
		click_button 'Create Review'
		expect(current_path).to eq '/restaurants'
		expect(page).to have_content "Awesome: *****"
	end
	
end