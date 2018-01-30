class AddPostToTrusts < ActiveRecord::Migration[5.1]
  def change
    add_reference :trusts, :post, foreign_key: true
  end
end
