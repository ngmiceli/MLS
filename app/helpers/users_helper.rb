module UsersHelper
	def gravatar_for(user, options = { :size => 50 })
		gravatar_image_tag(user.email.downcase, :alt => h(user.full_name),
		:class => 'gravatar',
		:gravatar => options)
	end
	
	def readable_sex(value)
		if value == 1
			return "Male"
		elsif value == 2
			return "Female"
		elsif value == 3
			return "I'd rather not say"
		end
	end
end
