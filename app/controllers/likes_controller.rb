class LikesController< ApplicationController

 def create 
   @post = Post.find(params[:post_id]) 
   @like = @post.likes.create(user_id:current_user.id, like:true) unless current_user.present? && @post.user == current_user
   respond_to do |format|
        
         format.js { }
      
     end 
   #redirect_to post_path(@post)
  end
end	