class Article < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :reviews, dependent: :destroy
	validates :category, presence: true
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
