class Url < ActiveRecord::Base
	validates :long_url, presence: true
	validates :long_url, format: { with: /\A(https|http):\/\// }
	before_save :shorten
	
	# This is Sinatra! Remember to create a migration!
	def shorten
		
		range = [*'0'..'9',*'A'..'Z',*'a'..'z']

		@short_url = (0...6).map{ range.sample }.join
		self.short_url = @short_url
	
	end
end
