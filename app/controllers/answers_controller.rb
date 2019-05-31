class AnswersController < ApplicationController
  def index
    @answers = Answe.all
  end
end
