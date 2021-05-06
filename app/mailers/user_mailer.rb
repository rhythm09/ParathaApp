class UserMailer < ApplicationMailer
  
  def welcome_mail
    @user = params[:user]
    @url = 'https://parathaapp.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to Paratha Application')
  end

  def place_order
    @order = params[:order]
    @user = @order.user
    @order_parathas = @order.order_parathas
    attachments['filename.pdf'] = File.read('/home/lenovo/Documents/CS21S63012071  scoreCard.pdf')

    mail(to: @user.email, subject: 'Welcome to Paratha Application')
  end
end
