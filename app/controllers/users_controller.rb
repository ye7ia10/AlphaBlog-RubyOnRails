class UsersController < ApplicationController

    before_action :set_user , only: %i[ show edit update destroy ]

    def new 
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome #{@user.username} to Alpha Blog, You successfully Signed Up !"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "Account Updated Successfully !"
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end

    def index
        # @users = User.all
        @users =  User.paginate(page: params[:page], per_page: 5)  #pagination
    end

    def show
        @articles = @user.articles
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password_digest)
    end

     # Use callbacks to share common setup or constraints between actions.
     def set_user
        @user = User.find(params[:id])
      end

end