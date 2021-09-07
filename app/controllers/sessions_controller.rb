class SessionsController < ApplicationController

    def new
    end

    def create  
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            flash[:notice] = "You Logged In Successfullly"
            session[:user_id] = user.id
            redirect_to user
        else
            flash.now[:alert] = "Your Email or Password is not correct"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "You Logged Out Successfully"
        redirect_to root_path
    end

end