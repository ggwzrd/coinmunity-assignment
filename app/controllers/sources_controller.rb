class SourcesController < BaseController
  skip_before_action :authenticate, only: [:index]

  def index
    sources = Source.all

    respond_to do |format|
      format.json{render status:200, json: sources.as_json }
    end
  end
end
