class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :description
      t.integer :total_mentions

      t.timestamps
    end
  end
end
