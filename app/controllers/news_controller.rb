class NewsController < ApplicationController
  def index
    @news = Node.where("url like '%#{request.fullpath[1..request.fullpath.length]}%'").first().news
  end
  def show
    @news = News.find params[:id]
  end
end
