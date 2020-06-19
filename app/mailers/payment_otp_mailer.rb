class PaymentOtpMailer < ApplicationMailer
  default from: "diegoariasm233@gmail.com"

  def send_otp_email
   
    @user = params[:user]
    mail(to:  @user.email, subject: "Order OTP")
  end
end
