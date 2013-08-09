class AddPermitToEnterprise < ActiveRecord::Migration
  def up
    add_column :enterprises, :permit, :boolean
    Enterprise.reset_column_information
    Enterprise.update_all(permit: true)
  end
end
