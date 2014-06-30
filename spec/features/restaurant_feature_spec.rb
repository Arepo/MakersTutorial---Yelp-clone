require 'rails_helper'

describe 'restaurant listing page' do
	
	context 'no restaurants' do
		it "says if it doesn't have any restaurants" do
			visit '/restaurants' 
			expect(page).to have_content 'No restaurants'
		end
	end

	context 'with restaurants' do
		before do
			Restaurant.create(name: 'Gardeners Arms')
		end

		it 'displays them' do
			visit '/restaurants'
			expect(page).to have_content 'Gardeners Arms'
		end
	end

	context 'introducing restaurants' do
		it 'can add restaurants' do
			visit '/restaurants/new' 
			fill_in 'Name', with: 'Gardeners Arms'
			click_button 'Create Restaurant'
			expect(current_path).to eq '/restaurants'
			expect(page).to have_content 'Gardeners Arms'
		end
	end

end