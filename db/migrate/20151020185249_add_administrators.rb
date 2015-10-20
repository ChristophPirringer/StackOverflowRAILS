class AddAdministrators < ActiveRecord::Migration
  def change
    add_column :users, :administrator, :boolean, default: false
  end
end
