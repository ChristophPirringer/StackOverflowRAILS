class Answer < ActiveRecord::Base
  belongs_to :post

  validates :author, :presence => true
  validates :content, :presence => true
  # validates_uniqueness_of :best, if: :only_best_is_true?
  #
  # def only_best_is_true?
  #   best == true
  # end


  default_scope { order('best DESC')}
end
