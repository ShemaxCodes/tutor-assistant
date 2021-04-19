class SessionsController < ApplicationController 
    

    #controller for logging in users   
   
   def index
       
   end
   
   def new
       user = User.find_by(id: session[:user_id])
       if logged_in?
           redirect_to user_assignments_path(user)
       end
   end 
   
   def create
       user = User.find_by(email: params[:session][:email].downcase)
       if user.teacher? && user.authenticate(params[:session][:password])
        #byebug
           log_in user
           redirect_to assignments_path
       elsif 
        user.student? && user.authenticate(params[:session][:password])
           log_in user
           redirect_to user_user_assignments_path(user)
       else 
           flash.now[:danger] = "Invalid email/password. Please try again."
           render :new
       end 
   end 
   
   
   
   def destroy
       log_out #if logged_in?
       redirect_to '/'
   end
   
   def google_login
    user_email = request.env['omniauth.auth']['info']['email']
    user_name = request.env['omniauth.auth']['info']['name']
    @user = User.find_or_create_by(email: user_email) do |user|
        user.username = user_name 
        user.password = SecureRandom.hex
    end 
        log_in @user
        redirect_to #the user's show page (list of assignments if student)
    end
   

end 