class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :reason
      t.references :user, foreign_key: true
      t.string :screenshot
      t.string :link
      t.integer :authenticity

      t.timestamps
    end
  end
end
