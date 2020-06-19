class ItemSubscribeAlertMailer < ApplicationMailer
  default from: "diegoariasm233@gmail.com"

  def item_available_email
    @item =  params[:item]
    puts params[:item]
    ItemSubscribe.where(itemid: @item.id).find_each do |alert|
      mail(to:  User.find(alert.userid).email, subject: "Item is available")
    end

  end

end
