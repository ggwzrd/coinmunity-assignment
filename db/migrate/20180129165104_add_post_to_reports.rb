class AddPostToReports < ActiveRecord::Migration[5.1]
  def change
    add_reference :reports, :post, foreign_key: true
  end
end
