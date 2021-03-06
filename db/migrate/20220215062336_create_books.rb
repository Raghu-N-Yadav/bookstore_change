class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.integer :published_in, null: false
      t.integer :volume
      t.timestamps
    end
  end
end
