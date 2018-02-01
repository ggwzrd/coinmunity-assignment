class TagsController < ApplicationController

  def index
    tags = Tag.all.map do |tag|
      name: tag.name,
      description: tag.description,
      total_mentions: tag.total_mentions,
      todays_mentions: tag.todays_mentions
    end

    respond_to do |format|
      format.json{render status:200, json: tags.as_json}
    end
  end

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
