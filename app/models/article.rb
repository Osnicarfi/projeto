class Article < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :reviews, dependent: :destroy
	validates :category, presence: true
end
