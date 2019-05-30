class StaticPageController < ApplicationController
  def index
    @questions = Question.all.paginate(page: params[:page])
  end
end
