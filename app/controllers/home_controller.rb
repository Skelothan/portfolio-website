class HomeController < ApplicationController
    def index
    end

    def about
        redirect_to home_path
    end

    def contact
    end
end