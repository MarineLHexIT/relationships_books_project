class CreateEditions < ActiveRecord::Migration[7.1]
  def change
    create_table :editions do |t|
      t.references :publisher, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.date :published_date
      t.string :published_type
      t.string :published_language

      t.timestamps
    end
  end
end
