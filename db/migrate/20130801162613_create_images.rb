class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.integer :enterprise_id

      t.timestamps
    end
  end
end
