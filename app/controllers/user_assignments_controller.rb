class UserAssignmentsController < ApplicationController

def index 
    #byebug
    @user_assignments = current_user.user_assignments 
end 

def show 
    #byebug 
    @user_assignment = current_user.user_assignments.find_by(user_id: params[:id], id: params[:user_id])
    #byebug
    render :show
    #byebug
end 

private
def user_assignment_params
    params.require(:user_assignment).permit(:user_id, :assignment_id) 
end 

end 