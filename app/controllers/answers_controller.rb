class AnswersController < ApplicationController

  def show
    @answer = Answer.find(params[:id])
    date = Answer.find(params[:id]).created_at
    @new_date = date.strftime("Created on %B %d %Y")
  end

#the HTML rendering of the form from "View"
  def new
    @answer = Answer.new
  end

  def create
    @wuestion = Question.find(params[:question_id])
    @answer = Answer.create(answer_params)

    @answer.question = @question

    if @answer.save
      flash[:notice] = "Answer is saved"
      redirect_to @question
    else
      flash[:error] = "Invalid input :("
      render :'questions/show'
      # render @question <-- does this work?
    end
  end



  private

  def answer_params
    params.require(:answer).permit(:description)
  end

end
