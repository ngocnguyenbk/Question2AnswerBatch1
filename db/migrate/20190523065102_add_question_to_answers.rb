class AddQuestionToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_reference :answers, :question, index: true, foreign_key: true
  end
end
