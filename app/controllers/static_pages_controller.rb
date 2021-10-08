class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:landing_page]
  
  def landing_page
    puts "SENDGRID_USERNAME: #{ENV['SENDGRID_USERNAME']}"
    puts "SENDGRID_PASSWORD: #{ENV['SENDGRID_PASSWORD']}"
    @courses = Course.all.limit(3)
    @latest_couses = Course.all.limit(3).order(created_at: :desc)
  end

  def privacy_policy
  end
  
  def activity
    @activities = PublicActivity::Activity.all
  end
  
end
