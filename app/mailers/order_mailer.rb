class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_confirmation.subject
  #
  def order_confirmation(user, order)
    @user = user
    @order = order
    @product = OrderedProduct.find(order.ordered_product_id)
    mail to: @user.email, subject: "Order Confirmation"
  end
end
