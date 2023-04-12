class UsersController < ApplicationController 
    def root
        render json: [1]
    end
end