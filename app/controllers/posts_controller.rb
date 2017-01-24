class PostsController < ApplicationController
	
  before_action :authenticate_user!, except: [:show]
  load_and_authorize_resource
   
      
  
   
  
  
  after_action :count_view, only:[:show] 
 
  def count_view
    @post.increment!(:countviews)  unless current_user.present? && @post.user == current_user
  end
   
   


  def index
    if params[:tag]
     
      @posts = current_user.posts.tagged_with(params[:tag])

    else
  	  @posts = current_user.posts.all.order("created_at desc").paginate(:page => params[:page],:per_page => 10)
    end
  end
  

  def show

    @post =Post.friendly.find(params[:id])  
    @comment = Comment.new
  end

  def new
  
    @post = Post.new
    @post.images.build
  end
  
  def edit
    @post = Post.find(params[:id])
  end
 
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end	
  
  def update
  	@post = current_user.posts.find(params[:id]) 
    if @post.update(post_params) 
      if@post.publish?
        @post.update_attributes({:published_at =>Time.now}) 
      end
      redirect_to posts_path, notice: "The post #{@post.title} has been uploaded."
    else
      render 'edit'
    end
  end

  def destroy 
  	@post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice:  "The posts #{@post.title} has been deleted."
  end	

  def search
   @posts = Post.find_by_name params[:search]
   redirect_to home_index_path
  end
 
  private
    def post_params
     params.require(:post).permit(:title, :tag_list, :body, :publish, :publish_date, images_attributes: [:attachment] )
    end

end
