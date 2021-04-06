class UsersController < ApplicationController
    
    protect_from_forgery
    
    #controller for signing up users
    def index 
  
    end 
  
    def new 
      @user = User.new 
    end
    
    def create
      #byebug
      @user = User.new(user_params)
        if @user.student && @user.save
          session[:user_id] = @user.id 
          flash[:success] = "Welcome to Your Student Dashboard!"
          byebug
          redirect_to login_path
        else 
          render :new 
        end 
      end 
 
  
    def show
      if current_user
        
        
      end
    end 
  
    private
  
      def user_params
          params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :role)
      end
  end