class PaymentGatewayController < ApplicationController
  def confirm

      PaymentOtpMailer.with(user: current_user).send_otp_email.deliver_now
  end

  def verifyOTP
    @order = Order.find(params[:order_id])
    if current_user.verify_otp(params[:otp])

      @order.status = "Exitoso"
      if  @order.save
        redirect_to order_process_processOrder_path(status: 'Exitoso', reason: 'Orden Comprada Exitosamente',order: @order)
      else
        redirect_to order_process_processOrder_path(status: 'Fallido', reason: "Error procesando la orden",order: @order)
      end
    else

      @order.status = "Fallido"
      @order.save!
      flash[:alert] = "Invalid OTP."
      redirect_to order_process_processOrder_path(status: 'Fallido', reason: "OTP Invalido",order: @order)
    end

  end
end
