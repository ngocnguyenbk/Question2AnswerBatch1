class QuestionsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def index
  end

  def new
    @question = Question.new
  end
    
  def show
    @question = Question.includes(:tags).find(params[:id])
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:success] = "Question created!"
      redirect_to root_url
    else
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit(:content, :title, tags_attributes: [:id, :content, :_destroy])
  end
end
