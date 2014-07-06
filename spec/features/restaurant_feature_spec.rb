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

	context 'with invalid data' do

		it "won't add a restaurant with no name" do
			visit '/restaurants/new' 
			fill_in 'Name', with: ''
			click_button 'Create Restaurant'
			expect(page).to have_content 'errors'
			expect(current_path).to eq '/restaurants'
		end

		before do
			Restaurant.create(name: "Gardeners Arms")
		end

		it "won't update a restaurant to be invalid" do
			visit '/restaurants'
			click_link 'Edit Gardeners Arms'
			fill_in 'Name', with: "GA"
			expect(page).to have_content 'errors'
		end
	end




end