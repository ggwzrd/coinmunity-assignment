class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.string :first_name
      t.string :last_name
      t.string :picture, default: 'http://res.cloudinary.com/dyyxiefx5/image/upload/v1517396145/coinmunity-logos/logo.svg'
      t.text :bio
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
