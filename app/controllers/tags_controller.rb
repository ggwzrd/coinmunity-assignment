class TagsController < BaseController
  skip_before_action :authenticate, only: [:index]

  def index
    tags = Tag.all.map do |tag|
      {id: tag.id,
      name: tag.name,
      description: tag.description,
      total_mentions: tag.total_mentions,
      todays_mentions: tag.todays_mentions}
    end

    respond_to do |format|
      format.json{render status:200, json: tags.as_json}
    end
  end
end
