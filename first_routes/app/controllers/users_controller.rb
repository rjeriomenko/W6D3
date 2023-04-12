class UsersController < ApplicationController 
    def root
        #print "root?"
        #render json: [1]
    end

    def index
        render plain: "You are in the user's resource"
    end 
end