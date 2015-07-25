class QuestionsController < ApplicationController

  http_basic_authenticate_with name: "mark", password: "hunter2",
   except: [:index, :show]
	
  def index
		@questions = Question.all
	end

	def show
    @question = Question.find(params[:id])
  end

	def new
    @question = Question.new
	end

  def edit
    @question = Question.find(params[:id])
  end

	def create
		@question = Question.new(question_params)
 
  	if @question.save
  	  redirect_to @question
    else
      render 'new'
    end
  end

  def update
    @question = Question.find(params[:id])
   
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
   
    redirect_to questions_path
  end

  private
  	def question_params
    	params.require(:question).permit(:title, :text)
  	end

end
