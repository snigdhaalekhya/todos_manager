class UsersController < ApplicationController
    skip_before_action :ensure_user_logged_in

    def new
    end

    def create
     user=User.find_by(email: params[:email])
     if user
         flash[:error]="This email is already registered. Please retry."
         redirect_to new_user_path 
     else
         user=User.create!(
            first_name: params[:first_name],
            last_name: params[:last_name],
            email: params[:email],
            password: params[:password],
         )
         session[:current_user_id]= user.id
         redirect_to "/"
    end
    end
end