class Article < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true, length:{minimum:3, maximum:20}
	validates :discription, presence: true, length:{minimum:10, maximum:200}
 self.per_page = 4
end