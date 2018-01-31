class SourcesController < BaseController

  def index
    sources = Source.all

    respond_to do |format|
      format.json{render status:200, json: sources.as_json }
    end
  end

end
