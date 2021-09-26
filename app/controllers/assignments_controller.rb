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
         all_students
        
         #byebug
     else 
         redirect_to login_path, notice: "Credentials not found"
     end 
 end 
 
 def create
     @assignment = Assignment.new(assignment_params) 
  
    if @assignment.save
     current_user.assignments << @assignment

    

     #session[:user_id] = @user.id
         redirect_to "/users/#{current_user.id}/assignments"
    else 
         redirect_to "/users/#{current_user.id}/assignments/new"
    end 
 end 
 
 
 
 def show 
     @assignment = Assignment.find_by(id: params[:id])
     if !current_user.assignments.include?(@assignment) #if the current user's assignments does not include this assignment then
     redirect_to assignments_path

     end
 end 
 
 
 def edit 
     if !logged_in?
         redirect_to login_path
     end
     @assignment = current_user.assignments.find_by(id: params[:id])
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
     @assignment.destroy
     #byebug
     redirect_to user_assignments_path
 end
 
 private
 
 
 
 
 def assignment_params
     params.require(:assignment).permit(:title, :instructions, :due_date, :score, :user_ids, :file)
 end

 def admin_only
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end

  def all_students
    @students = User.all_students
  end

  
end 