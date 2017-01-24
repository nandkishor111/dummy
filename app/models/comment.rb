class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable
   
   after_create :notify_user,  
   
    def notify_user
    
   	    if user.notification? 
      	  UserMailer.new_comment(post.user).deliver
        end	
    end
end
    