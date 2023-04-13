class UsersController < ApplicationController 
    def root
        #print "root?"
        #render json: [1]
    end

    def index
        @users = User.all
        render json: @users
    end 

    def create
        user = User.new(strong_params)
        @user = user.save
        # redirect_to users_url
        if @user
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity #422
        end
    end
    
    def show
        if params[:id].to_i == 10
        render plain: "Yes, the ID is #{params[:id]}"
        else 
        render plain: "No, the ID is actually #{params[:id]}"
        end 

    end

    private
    def strong_params
        params.require(:user).permit(:name, :email)
    end
end



