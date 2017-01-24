class UsersController < ApplicationController
  

  def show
    @user=User.find(params[:id])
  end	
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]) 
    if @user.update(user_params) 
      redirect_to user_path, notice: "The user Profile image has been uploaded."
    else
      render 'edit'
    end
  end

  def destroy 
  	@user = User.find(params[:id])
    @user.destroy
    redirect_to admin_path, notice:  "The users #{@user.first_name} has been deleted."
  end	

  def change_role
    @approverole = Approverole.new   
  end  
  
  def password_change
    @user = User.find(params[:id])
  end


  def  allow_notification
    @user = User.find(params[:id])
    @user.update_attributes(:notification => true) 
    redirect_to edit_user_registration_path
  end  
 
  private 
    def user_params
    	params.require(:user).permit(image_attributes:[:attachment])
    end

end 