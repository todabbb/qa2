class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    @answer.save
    redirect_to question_url @question
  end

private

def answer_params
  params.require(:answer).permit(:select_flg)
end
end


=begin

class AnswersController < ApplicationController
  before_action :set_question

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)
    @answer.save
    redirect_to question_url @question
  end

private
    def answer_params
      params.require(:answer).permit(:select_flg)
    end  
    
    def set_question
      @question = current_user.questions.find_by(id: params[:question_id])
      redirect_to(question_url, alert: "ERROR!!") if @question.blank?
    end
end


=end
