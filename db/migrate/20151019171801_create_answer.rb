class CreateAnswer < ActiveRecord::Migration
  def change
    create_table :answers do |t|
        t.column :author, :string
        t.column :content, :string
        t.column :post_id, :integer

        t.timestamps
    end
  end
end
