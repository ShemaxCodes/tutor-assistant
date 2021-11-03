class UserAssignmentsController < ApplicationController
    before_action :current_user

def index 
    
    @user_assignments = current_user.assignments 
end 

def show 
  
    @user_assignment = current_user.assignments.find_by(id: params[:id])
    
    render :show
    
end 

private
def user_assignment_params
    params.require(:user_assignment).permit(:user_id, :assignment_id) 
end 

end 