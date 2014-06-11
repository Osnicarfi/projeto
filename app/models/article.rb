class Article < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :reviews, dependent: :destroy
	validates :category, :content, :title, presence: true
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	 # def votes_descending
	  #  select('articles.*, count(reviewss.id) as review_count').joins('LEFT OUTER JOIN reviews on reviews.article_id = articles.id').group_by('articles.id').order('reviews_count desc')
	 # end

  def since(date)
    where('created_at >= ?', date)
  end

end
