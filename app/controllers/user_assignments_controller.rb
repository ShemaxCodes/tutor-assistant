class UserAssignmentsController < ApplicationController




def show 
    #byebug 
    @user_assignment = current_user.user_assignments.find_by(user_id: params[:id], id: params[:user_id])
    #byebug
    render :show
    #byebug
end 

end 