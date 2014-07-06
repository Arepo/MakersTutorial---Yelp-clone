class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all
	end

    # GET /restaurants/new HTTP/1.1
	def new
		@restaurant = Restaurant.new
	end

    # POST /restaurants HTTP/1.1 (see rake routes)
	def create
		@restaurant = Restaurant.new restaurant_params 

		if @restaurant.save
		  redirect_to '/restaurants'
		else
		  render 'new'
		end
	end

	def edit
		@restaurant = Restaurant.find params[:id]
	end

	def update
		@restaurant = Restaurant.find params[:id]
		
	    if @restaurant.update restaurant_params

		  redirect_to '/restaurants'
		else
		  render 'edit'
		end
	end

	def restaurant_params
		params.require(:restaurant).permit(:name)
	end

	def destroy
		@restaurant = Restaurant.find params[:id]
		@restaurant.destroy
		flash[:notice] = 'Restaurant successfully deleted'
		redirect_to '/restaurants'
	end

end
