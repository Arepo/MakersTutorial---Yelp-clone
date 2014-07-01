require 'rails_helper'

describe 'restaurant listing page' do
	
	context 'no restaurants' do
		it "says if it doesn't have any restaurants" do
			visit '/restaurants/' 
			expect(page).to have_content 'No restaurants'
		end
	end

	context 'with restaurants' do
		before(:each) do
			Restaurant.create(name: "Gardener's Arms")
		end

		it 'displays them' do
			visit '/restaurants/'
			expect(page).to have_content "Gardener's Arms"
		end

		it 'can edit names' do
			visit '/restaurants/'
			click_link "Edit Gardener's Arms"
			fill_in 'Name', with: "Gardeners Arms"
			click_button 'Update Restaurant'
			expect(current_path).to eq '/restaurants'
			expect(page).to have_content "Gardeners Arms"
		end

		it 'can end their brief lives' do
			visit '/restaurants/'
			click_link "Delete Gardener's Arms"
			expect(current_path).to eq '/restaurants'
			expect(page).not_to have_content "Gardener's Arms" #not a good test on its own - could just redirect to any random webpage
			expect(page).to have_content 'Restaurant successfully deleted' #will clash with line above atm
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