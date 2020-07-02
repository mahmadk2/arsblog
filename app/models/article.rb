class Article < ActiveRecord::Base
	validates :title, presence: true, length:{minimum:3, maximum:20}
	validates :discription, presence: true, length:{minimum:10, maximum:200}

end