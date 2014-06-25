class Article < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :reviews, dependent: :destroy
	validates :category, :content, :title, presence: true
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }


  def since(date)
    where('created_at >= ?', date)
  end

end
