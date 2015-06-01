class NodesController < ApplicationController
  def show
    if(params[:page])
      node_url = params[:section] + '/' + params[:page] + '/'
    else
      node_url = params[:section] + '/'
    end

    @node = Node.find_by_url(node_url)
    redirect_to '/' + @node.the_link_to if @node.the_link_to != ''
  end
end
