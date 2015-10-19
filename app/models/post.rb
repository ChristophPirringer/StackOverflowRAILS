class Post < ActiveRecord::Base
  has_many :answers

  validates :name, :presence => true
  validates :author, :presence => true
  validates :content, :presence => true
end
