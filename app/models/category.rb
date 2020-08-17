class Category < ActiveRecord::Base

 validates :name, presence: true, uniqueness:{case_sensitive: false},
	          length: {minimum: 5, maximum: 25}
end