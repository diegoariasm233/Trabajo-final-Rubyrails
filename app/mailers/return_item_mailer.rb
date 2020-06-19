class ReturnItemMailer < ApplicationMailer
  default from: "diegoariasm233@gmail.com"

  def send_return_item_email
    @return_item = params[:return_item]
    @order = params[:order]
    @user = User.find(params[:user])
    mail(to:  @user.email, subject: "Retorno de Item aprobado")
  end
end
