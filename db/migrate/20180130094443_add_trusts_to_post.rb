class AddTrustsToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :trust, foreign_key: true
  end
end
