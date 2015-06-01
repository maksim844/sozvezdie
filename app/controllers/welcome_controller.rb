class WelcomeController < ApplicationController
  def academy
    params[:section] = 'academy'
    section = Section.find_by_uri(params[:section])
    section_id = section.id
    node_id = Node.find_by_url(params[:section] + '/').id
    news_node_id = Node.where("content_producer = 'News' and ancestry = #{node_id}").first().id
    @news = News.where(node_id: news_node_id).order('id desc').limit(3)
    @setting = Setting.find_by_section_id(section_id)
    render 'show'
  end

  def show
    section = Section.find_by_uri(params[:section])
    @title = section.title
    node_id = Node.find_by_url(params[:section] + '/').id
    news_node_id = Node.where("content_producer = 'News' and ancestry = #{node_id}").first().id
    @news = News.where(node_id: news_node_id).order('id desc').limit(3)
    @setting = Setting.find_by_section_id(section.id)
  end
end
