class CreateTrusts < ActiveRecord::Migration[5.1]
  def change
    create_table :trusts do |t|
      t.references :source, foreign_key: true
      t.references :user, foreign_key: true
      t.string :screenshot
      t.string :link
      t.integer :authenticity

      t.timestamps
    end
  end
end
