require 'rails_helper'


	describe 'average_rating' do

		let(:red_star) {Restaurant.create name: 'Red Star'}

		it 'returns N/A if there are no reviews' do
			expect(red_star.average_rating).to eq 'N/A'
		end

		it 'returns the rating if there is one review' do
			red_star.reviews.create(rating: 5)
			expect(red_star.average_rating).to eq 5
		end

		it 'returns the average rating if there are two reviews' do
			red_star.reviews.create(rating: 5)
			red_star.reviews.create(rating: 3)
			expect(red_star.average_rating).to eq 4
		end
	end

	describe 'validations' do
		it "doesn't accept nameless restaurants" do
			expect(Restaurant.create(name: nil)).to have(2).errors_on(:name)
		end

		it "doesn't accept restaurants with a name that is less than 3 chars" do
			expect(Restaurant.create(name: 'NO')).to have(1).error_on(:name)
		end

		
	end
