class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.string :first_name
      t.string :last_name
      t.string :picture
      t.text :bio
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
