class UserMailer < ApplicationMailer

  def order_email(order)
    @order = order

    @line_items = LineItem.where(order_id: order.id)
    @products = []

    @line_items.each do |item|
      @products.push(Product.where(product_id: item[:product_id]))
    end

    mail(to: order.email, subject: 'Your Jungle order')

  end
end
