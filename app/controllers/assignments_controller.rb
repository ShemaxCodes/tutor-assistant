class AssignmentsController < ApplicationController
     before_action :current_user, only: [:show, :index, :new, :create, :edit]
     protect_from_forgery
 
 def index 
    if current_user
         @assignments = @current_user.assignments
    else
         @assignments = Assignment.all
    end
end 
 
 
 
 def new
     if current_user
         @assignment = Assignment.new
     else 
         redirect_to login_path, notice: "User not found"
     end 
 end 
 
 def create
     @assignment = Assignment.new(assignment_params) 
    if @assignment.save
     current_user.assignments << @assignment
     #session[:user_id] = @user.id
         redirect_to user_assignments_path
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
     @business = current_user.businesses.find_by(user_id: params[:id], id: params[:user_id])
         if @business.title != nil || @business.description != nil 
                 render :edit
             else 
                 redirect_to new_user_business_path
             end 
          
 end 
 
 def update
     business = Business.find_by(id: params[:id])
     business.update(business_params)
     business.save
     redirect_to user_businesses_path
 end 
 
 def destroy
     @business = Business.find_by(id: params[:id])
     @business.destroy
     redirect_to user_businesses_path
 end
 
 private
 
 
 
 
 def business_params
     params.require(:business).permit(:title, :image, :city, :state, :user_id, :category_id, :description)
 end


 end
    