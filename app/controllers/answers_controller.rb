class AnswersController < ApplicationController
   # 回答の登録
   def create 
     @question = Question.find(params[:id])
     @question.answers.create(answer_params)
     redirect_to question_path(@question)
   end

   def destroy 

   end

   private 
   def answer_params 
    params.require(:answer).permit(:name,:content)
   end

end
