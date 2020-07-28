class User < ActiveRecord::Base
	has_many :articles
	has_secure_password
  has_secure_password :recovery_password, validations: false
	before_save {self.email = email.downcase}

	validates :username, presence: true, uniqueness:{case_sensitive: false},
	          length: {minimum: 5, maximum: 25}
             
             REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, uniqueness:{case_sensitive: false},
	           length: {maximum: 100}, format:{with: REGEX }          
  

end