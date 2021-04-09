class AssignmentsController < ApplicationController
     before_action :current_user
     protect_from_forgery
 
 def index 
    if current_user
         @assignments = @current_user.assignments
    else
         @assignments = Assignment.all
    end
end 
 
 
 
 def new
    #byebug
     if current_user.teacher?
         @assignment = Assignment.new
     else 
         redirect_to login_path, notice: "Credentials not found"
     end 
 end 
 
 def create
     @assignment = Assignment.new(assignment_params) 
    if @assignment.save
     current_user.assignments << @assignment
     #session[:user_id] = @user.id
         redirect_to user_assignments_path(:user_id)
    else 
         redirect_to new_user_assignment_path
    end 
 end 
 
 
 
 def show 
     #byebug 
     @assignment = current_user.assignments.find_by(user_id: params[:id], id: params[:user_id])
         #byebug
         render :show
     #byebug
 end 
 
 
 def edit 
     if !logged_in?
         redirect_to login_path
     end
     @business = current_user.assignments.find_by(user_id: params[:id], id: params[:user_id])
         if @assignment.title != nil || @assignment.instructions != nil 
                 render :edit
             else 
                 redirect_to new_user_assignment_path
             end 
          
 end 
 
 def update
     assignment = Assignment.find_by(id: params[:id])
     assignment.update(assignment_params)
     assignment.save
     redirect_to user_assignments_path
 end 
 
 def destroy
     @assignment = assignment.find_by(id: params[:id])
     @assignment.destroy
     redirect_to user_assignments_path
 end
 
 private
 
 
 
 
 def assignment_params
     params.require(:assignment).permit(:title, :instructions, :due_date, :score)
 end


 end
    