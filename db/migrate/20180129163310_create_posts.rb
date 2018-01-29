class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.string :link
      t.string :images
      t.string :video
      t.boolean :is_spam, default: false

      t.timestamps
    end
  end
end
