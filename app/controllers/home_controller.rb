class HomeController < ApplicationController
  before_action :check_date, only:[:index]

    def check_date
      @posts=Post.all
      PublishWorker.perform_async(@posts) 
    end

   def index
     @posts=Post.approve.publish.most_view_post.paginate(:page => params[:page])
     @posts= @posts.search(params[:search]) if params[:search].present?
   end
    
    
end 
