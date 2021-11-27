class CommentsController < ApplicationController
  before_action :find_complain
  before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
  before_action :comment_owner, only: [:destroy, :edit, :update]
  before_action :authenticate_user!

  def create
    @comment = @complain.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.save
    
    
    if @comment.save
      
      @commentArray = []

      # for current user 
      unless @commentArray.include? current_user.email
        @commentArray.push(current_user.email)
      end
      
      # getting email for those who have commented.
      @complain = @comment.complain
      @comments = @complain.comments

      @comments.each do |comment|
        unless @commentArray.include? comment.user.email
          @commentArray.push(comment.user.email)
        end
      end

      # getting email for the customer care to whom the complain is assigned
      @assigns = Assign.all 
      @assigns.each do |assign|
        if assign.complain_id == @complain.id
          unless @commentArray.include? assign.user.email
            @commentArray.push(assign.user.email)
          end
        end
      end
      
      #Sending mail
      @commentArray.each do |comment|
        ComplainMailer.with(email: comment).comment.deliver
      end

      redirect_to complain_path(@complain)
    else
      render "new"
    end
  end

  def destroy
    @comment.destroy
    redirect_to complain_path(@complain)
  end

  def edit
  end

  def update
    if @comment.update(params[:comment].permit(:content))
      redirect_to complain_path(@complain)
    else
      render "edit"
    end
  end

  private

  def find_complain
    @complain = Complain.find(params[:complain_id])
  end

  def find_comment
    @comment = @complain.comments.find(params[:id])
  end

  def comment_owner
    unless current_user.id == @comment.user_id
      flash[:notice] = "You are not authorized"
      redirect_to @complain
    end
  end
end
