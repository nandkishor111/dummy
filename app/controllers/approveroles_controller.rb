class ApproverolesController < ApplicationController
    def create
      @approverole =Approverole.new(approverole_params)
      @approverole.user_id=current_user.id
      if @approverole.save
       	redirect_to posts_path
      end
   	end

    def request_confirm
      @approverole = Approverole.find(params[:id])
      @approverole.update_attributes(:approve_role => true)
    end
     
    private
     def approverole_params
       params.require(:approverole).permit(:role_id)       
     end 
end