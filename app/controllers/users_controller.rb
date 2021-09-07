class UsersController < ApplicationController

    before_action :set_user , only: %i[ show edit update destroy ]
    before_action :require_user , only: %i[edit update destroy]
    before_action :require_same_user , only: %i[edit update destroy]

    def new 
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
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

    def destroy
        @user.destroy
        session[:user_id] = nil if @user == current_user
        flash[:notice] = "Account Deleted !"
        if !current_user.admin?
            redirect_to root_path
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

     # Use callbacks to share common setup or constraints between actions.
    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user 
        if current_user != @user && !current_user.admin?
            flash[:alert] = "Acction Denied"
            redirect_to @user
        end
    end

end