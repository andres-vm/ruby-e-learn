class UsersController < ApplicationController
    
    def index
        #if params[:title]
        #  @courses = Course.where('title ILIKE ?', "%#{params[:title]}%") #case-insensitive
        #else
        #  #@courses = Course.all
        #  
        #  #@q = Course.ransack(params[:q])
        #  #@courses = @q.result.includes(:user)
        #end
        @ransack_courses = Course.ransack(params[:courses_search], search_key: :courses_search)
        @courses = @ransack_courses.result.includes(:user)
    end
    
end