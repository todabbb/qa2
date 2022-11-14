class QuestionsController < ApplicationController
  def index
    @questions = current_user.questions.all
  end

  def show
    @question = current_user.questions.find(params[:id])
  end

  def new
     @question = current_user.questions.new
  end

  def create
    @question = current_user.questions.new(question_params)
    @question.save
    redirect_to question_url @question
  end

  def edit
    @question = current_user.questions.find(params[:id])
  end

  def update
    @question = current_user.questions.find(params[:id])
    @question.update(question_params)
    redirect_to question_url @question
  end

  def destroy
    @question = current_user.questions.find(params[:id])
    @questiont.destroy
    redirect_to question_url
  end
  
private
    def question_params
      params.require(:question).permit(:question_content, :answer_content)
    end
end
