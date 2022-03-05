class CreateIssuedBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :issued_books do |t|
      t.boolean :issued, null: false, :default => 0
      t.string :issued_to, null: false, :default => "student"
      t.string :issued_date
      t.string :return_Date
      t.references :book, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
