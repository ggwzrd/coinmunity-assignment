class TagsController < ApplicationController
  def create
    tag = Tag.new(tag_params)

    if tag.save
      render notice: "Tag created",json: tag.as_json
    else
      render notice: "Tag not created", json: tag.errors.full_messages
    end

  end

  def tag_params
    params.require(:tag).permit(:name, :description, :post_id, :user_id)
  end
end
