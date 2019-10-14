class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    date = Question.find(params[:id]).created_at
    @new_date = date.strftime("Created on %B %d %Y")
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question submitted! :)'
      redirect_to question_path(@question)
    else
      flash[:error] = "Invalid input :("
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
