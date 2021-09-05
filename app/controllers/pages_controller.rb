class PagesController < ApplicationController
   
    def home  #this by default will expect home.html.erb file 
        redirect_to articles_path if logged_in?
    end

    def about #for the about page in
    end
end
