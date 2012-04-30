class User < ActiveRecord::Base
	include FriendlyId
  
	friendly_id :username
	
	attr_accessor :password
	attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :birthday, :sex, :zip, :description, :username
  
	has_many :college_profile, :dependent => :destroy
	has_many :school_profile, :dependent => :destroy
  
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	username_regex = /^[a-z][a-z0-9\-_]*[a-z0-9]$/i

	validates :first_name,  :presence 	=> true,
				:length 	=> { :maximum => 50 }
	validates :last_name,   :presence 	=> true,
				:length 	=> { :maximum => 50 }		
	validates :email, :presence 		=> true,
			:format  		=> { :with => email_regex },
			:uniqueness 		=> { :case_sensitive => false }
			
	validates :description, :length		=> { :maximum => 300 }
	validates :username,	:presence	=> true,
				:format		=> { :with => username_regex },
				:uniqueness	=> { :case_sensitive => false },
				:length		=> { :within => 3..25}
	
	validate :limit_colleges
	validate :limit_schools
					
	# Automatically create the virtual attribute 'password_confirmation'.
	validates :password,
		       :presence    	=> true,
                       :confirmation	=> true,
                       :length		=> { :within => 6..40 },
                       :on		=> :create
        
					   
	before_save :encrypt_password, :unless => Proc.new { |u| u.password.blank? }
	
	# Return true if the user's password matches the submitted password.
	def has_password?(submitted_password)
		encrypted_password == encrypt(submitted_password)
	end
	
	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil  if user.nil?
		return user if user.has_password?(submitted_password)
	end
	
	def self.authenticate_with_salt(id, cookie_salt)
		user = find_by_id(id)
		(user && user.salt == cookie_salt) ? user : nil
	end
	
	def full_name()
		return first_name + " " + last_name
	end
	
	private
		
		def limit_schools
			if school_profile.count >= 3
				errors[:base] << "You can only have up to 3 high schools"
			end
		end
		
		def limit_colleges
			if college_profile.count >= 3
				errors[:base] << "You can only have up to 3 colleges"
			end
		end
		
		def encrypt_password
		  self.salt = make_salt unless has_password?(password)
		  self.encrypted_password = encrypt(password)
		end

		def encrypt(string)
		  secure_hash("#{salt}--#{string}")
		end
	  
		def make_salt
		  secure_hash("#{Time.now.utc}--#{password}")
		end
		
		def secure_hash(string)
		  Digest::SHA2.hexdigest(string)
		end
end