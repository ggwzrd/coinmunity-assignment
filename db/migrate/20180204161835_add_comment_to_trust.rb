class AddCommentToTrust < ActiveRecord::Migration[5.1]
  def change
    add_column :trusts, :comment, :text
  end
end
