class TeachersController < ApplicationController
  def index
    @teachers = Node.where("url like '%#{request.fullpath[1..request.fullpath.length]}%'").first().teachers
  end

  def show
    @teacher = Teacher.find params[:id]
  end
end
