class Changeaudiencetointeger < ActiveRecord::Migration
  def up
  	change_table :shoes do |t|
      t.change :audience, :integer
  	end
  end

  def down
  	change_table :shoes do |t|
      t.change :audience, :string
  	end
  end
end
