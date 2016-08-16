class User < ActiveRecord::Base

	EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	validates_presence_of :full_name, :email, :location
	validates_length_of :bio, minimum: 30, allow_blank: false
	validates_format_of :email, with: EMAIL_REGEXP
	validates_uniqueness_of :email

	has_secure_password

end
