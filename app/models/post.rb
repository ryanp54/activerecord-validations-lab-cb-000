class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :summary, length: {maximum: 250}
	validates :content, length: {minimum: 250}
  validate 	:valid_category, :good_title

	def valid_category
		if category != 'Fiction' and category != 'Non-Fiction'
			errors.add(:category, 'is not "Fiction" or "Non-Fiction.')
		end
	end

	def good_title
		if title && !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Top [number]") && !title.include?("Guess")
			errors.add(:title, 'is not clickbait')
		end
	end
end
