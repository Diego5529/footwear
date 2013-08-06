class AddLockColumnToShoes < ActiveRecord::Migration
  def change
    add_column :shoes, :lock_version, :integer, :default=>0
  end
end
