class SearchController < ApplicationController
  def index
    @flowers =
      Flower.search(params[:term])
  end
end
