class CreateReaders < ActiveRecord::Migration[7.1]
  def change
    create_table :readers do |t|
      t.string :login
      t.string :email

      t.timestamps
    end
  end
end
