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
		expect(page).to have_content "Awesome: ★★★★★"
	end

	it "displays the average of user reviews" do
		visit '/restaurants'
		add_review('Not enough meat', 3)
		add_review('Top class', 5)
		expect(page).to have_content "Average rating: ★★★★☆"

	end

	def add_review(review, rating)
		click_link 'Review Gardeners Arms'
		fill_in 'Content', with: review
		select rating, from: 'Rating'
		click_button 'Create Review'
	end
	
end

