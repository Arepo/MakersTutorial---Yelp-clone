class ReviewsController < ApplicationController

	def new
		@restaurant = Restaurant.find params[:restaurant_id]
		@review = Review.new
	end

	def create
		# @restaurant = Restaurant.find params[:restaurant_id]
  #    	@review = @restaurant.reviews.create params[:review].permit(:content, :rating)
 
  #    	flash[:notice] = 'Review created!'
  #    	redirect_to '/restaurants'
		Review.create(restaurant_id: params[:restaurant_id], rating: params[:review][:rating], content: params[:review][:content])
    	redirect_to '/restaurants'
   end

# params.require(:restaurant).permit(:name)

end

