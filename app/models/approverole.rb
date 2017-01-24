class Approverole < ApplicationRecord
  belongs_to :user
  belongs_to :role

  after_update :user_role_change, only:[:request_confirm]

   
  def user_role_change
       user.add_role role.name  

       if user.notification? && approve_role?
       	  UserMailer.welcome_email(user).deliver
       end	
  end	
  

end