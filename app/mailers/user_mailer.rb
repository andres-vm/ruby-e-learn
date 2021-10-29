class UserMailer < ApplicationMailer
    
    def new_user(user)
        @user = user
        mail(
          to: User.with_role(:admin).distinct.pluck(:email), 
          subject: "E-learn: #{@user.email} registred"
        )
    end
    
end
