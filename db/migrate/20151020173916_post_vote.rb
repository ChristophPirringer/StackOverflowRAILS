class PostVote < ActiveRecord::Migration
  def change
      add_column :posts, :votes, :integer
  end
end
