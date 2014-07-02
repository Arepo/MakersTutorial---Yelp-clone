require 'rails_helper'

RSpec.describe ReviewsHelper, :type => :helper do
	describe '#star_rating' do 

		context 'not a number' do
			it 'returns the input unchanged' do
				expect(star_rating("monkey")).to eq "monkey"
			end
	 	end

	 	context 'rating of 5' do
	 		it 'returns five solid stars' do
	 			expect(star_rating(5)).to eq "★★★★★"
	 		end
	 	end

	 	context 'rating of 1' do
	 		it 'returns 1 solid star and five hollow stars' do
	 			expect(star_rating(1)).to eq "★☆☆☆☆"
	 		end
		end

		context 'floats' do
			it 'rounds the number up when remainder is .5 or above' do
				expect(star_rating(3.5)).to eq "★★★★☆"
			end

			it 'rounds the number down when remainder is less' do
				expect(star_rating(3.49)).to eq "★★★☆☆"
			end
		end
	end
end