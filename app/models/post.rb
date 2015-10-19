class Post < ActiveRecord::Base
  has_many :answers

  validates :name, :presence => true
  validates :author, :presence => true
  validates :content, :presence => true

  # scope :ordered_by_reverse_order, -> { order('created_at ASC')}
  default_scope { order('created_at DESC')}
end
