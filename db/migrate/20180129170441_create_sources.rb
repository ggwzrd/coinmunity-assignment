class CreateSources < ActiveRecord::Migration[5.1]
  def change
    create_table :sources do |t|
      t.string :name
      t.integer :authenticity
      t.string :logo
      t.string :description
      t.string :domain
      t.boolean :secure_connection
      t.boolean :verified

      t.timestamps
    end
  end
end
