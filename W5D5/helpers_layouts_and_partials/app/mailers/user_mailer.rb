class UserMailer < ApplicationMailer
   
    def welcome_email(user)
        @user = user
        @url  = 'http://localhost:3000/session/new'
        mail(to: user.username, subject: 'Welcome to My 99 cat site')
    end

end
