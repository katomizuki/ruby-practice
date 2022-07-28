class QuestionsController < ApplicationController
  ## 質問一覧表示
  def index 
    @questions = Question.all
    p @question
  end

  def show
    @question = Question.find(params[:id])
    p @question
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    # QuestionモデルをDBへ保存
    if @question.save
      ## showへリダイレクト
    redirect_to @question
    else 
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to question_path
  end

  private 
  def question_params 
    params.require(:question).permit(:title, :name, :content)
  end

  
end
