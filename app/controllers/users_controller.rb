class UsersController < ApplicationController

    def new
        @user = User.new

    end

    def create
        @user = User.new(params.require(:users).permit(:name, :email, :password))
        if @user.save
            session[:user_id] = @user.id
            redirect_to users_path
        else
            render 'new'
        end
    end

    def index
        @users = User.all
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(params.require(:user).permit(:name, :email, :password))
            redirect_to "/users"
        else
            render 'edit'
        end

    end


    def show
        @user = User.find(params[:id])
        @flights = @user.flights
    end
    
    def destroy
        @user = User.find(params[:id])
        if @user.destroy
          session[:user_id] = nil # Ensure the current_user session is cleared if the user being deleted is the current user
          redirect_to users_path, notice: 'User was successfully deleted.'
        else
          redirect_to users_path, alert: 'Failed to delete the user.'
        end
      end
      

end