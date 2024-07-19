class UsersController < ApplicationController

    def new

        @user = User.new

    end

    def create
        @user = User.new(params.require(:users).permit(:name, :email, :password))


        if @user.save
            render 'index'
        else
            render 'new'
        end




    end

    def index
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

end