class CommentsController < ApplicationController
  before_action :authenticate_user! 
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id 
    if @comment.save
      redirect_to post_path(@post)
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
  

 def like_comment

    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    
    @comment.likes.create(user_id:current_user.id, like:true) 

    respond_to do |format|
        
         format.js { }
      
     end 
 
    #redirect_to post_path(@post)
  end
 
  private
    def comment_params

      params.require(:comment).permit(:comment, :approve)
    end
  end
