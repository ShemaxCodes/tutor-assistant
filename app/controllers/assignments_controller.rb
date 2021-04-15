class AssignmentsController < ApplicationController
     before_action :current_user
     #before_action :admin_only, :except => :show, :new, :create
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
     @assignment = Assignment.find_by(id: params[:id])
     if !current_user.assignments.include?(@assignment)
     redirect_to assignments_path

     end
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

 def admin_only
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end

 end
    