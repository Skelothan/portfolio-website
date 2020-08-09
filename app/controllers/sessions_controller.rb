class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_username(params[:username])
        if user and user.authenticate(params[:password]) then
            session[:user_id] = user.id
            redirect_to projects_path, notice: "Welcome back, Jonathan."
        else
            flash.now.alert = "Incorrect password."
            render "new"
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to projects_path, notice: "Logged out."
    end
end