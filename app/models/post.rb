class Post < ActiveRecord::Base
  has_many :answers
  has_many :upvotes, dependent: :destroy


  validates :name, :presence => true
  validates :author, :presence => true
  validates :content, :presence => true

  # scope :ordered_by_reverse_order, -> { order('created_at ASC')}
  default_scope { order('created_at DESC')}

  def self.created_today(day)
    if (Post.first.created_at.to_date === day)
        return "at least one today"
    end
  end

  def score
      upvotes.count
  end
end
