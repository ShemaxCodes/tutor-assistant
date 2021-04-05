class UsersController < ApplicationController
    
    protect_from_forgery
    
    #controller for signing up users
    def index 
  
    end 
  
    def new 
      @user = User.new 
    end
    
    def create
      @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id 
          flash[:success] = "Welcome to the Forge App!"
          redirect_to login_path
        else 
          render :new 
        end 
      end 
  
    def show
      if current_user
        #user = User.find(params[:user_id])
        redirect_to user_businesses_path(@current_user)
      else 
        redirect_to "/"
      
        
      end
    end 
  
    private
  
      def user_params
          params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
      end
  end