module ReviewsHelper

	def star_rating(rating)
		return rating unless rating.is_a? Numeric
		hollow_stars = "☆" * (5 - rating.round)
		("★" * rating.round) + hollow_stars
	end

end
