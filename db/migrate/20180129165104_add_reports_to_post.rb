class AddReportsToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :report, foreign_key: true
  end
end
