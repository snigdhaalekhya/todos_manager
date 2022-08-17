class SessionsController < ApplicationController 
    def new
    end
    def create
        user=User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:current_user_id]=user.id
            redirect_to "/"
       else
            render plain: "Incorrect password"
       end

    end
end