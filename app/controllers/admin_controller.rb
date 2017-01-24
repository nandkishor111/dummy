class AdminController < ApplicationController
   
  def index
  	@posts=Post.all.order("created_at desc").paginate(:page => params[:page])
    @posts= @posts.search(params[:search]) if params[:search].present?
  end
   
  def show 
     @users=User.all
  end 

  def receive_request
    @approveroles = Approverole.all
  end 
   
  def destroy 
  	@post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_index_path, notice:  "The posts #{@post.title} has been deleted."
  end	 
   
  def approve_post
   	@post = Post.find(params[:id])
    @post.update_attributes(:panding => true) 
    redirect_to admin_index_path
  end

end
