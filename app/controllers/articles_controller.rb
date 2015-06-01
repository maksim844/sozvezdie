class ArticlesController < ApplicationController

  def index
    @articles = Node.where("url like '%#{request.fullpath[1..request.fullpath.length]}%'").first().articles
  end
  def show

  end
end
