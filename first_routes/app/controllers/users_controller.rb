class UsersController < ApplicationController 
    def root
        #print "root?"
        #render json: [1]
    end

    def index
        render plain: "You are in the user's resource"
    end 

    def create
        password1 = params[:password][:password1]
        password2 = params[:password][:password2]
        username = params[:username]
        render json: [username, password1, password2]
        #render plain: "#{params[:num].to_i * 10}"
    end
    
    def show
        if params[:id].to_i == 10
        render plain: "Yes, the ID is #{params[:id]}"
        else 
        render plain: "No, the ID is actually #{params[:id]}"
        end 

    end
end



