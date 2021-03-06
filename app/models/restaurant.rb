class Restaurant < ActiveRecord::Base
	has_many :reviews
	validates :name, presence: true, length: { minimum: 3 }


	def average_rating
		return 'N/A' if reviews.none?
		reviews.average(:rating)
	end

end
