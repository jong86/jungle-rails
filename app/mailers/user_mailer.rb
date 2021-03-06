class UserMailer < ApplicationMailer

  def order_email(order)
    @order = order

    @line_items = LineItem.where(order_id: order.id)
    @products = []

    @line_items.each do |item| # lists all products (missing product names)
      @products.push(Product.where(product_id: item[:product_id]))
    end

    mail(to: order.email, subject: "Your receipt for Jungle order ##{order.id}")
  end

  def welcome_email(user) # sent upon user registration
    @user = user
    mail(to: user.email, subject: "Welcome to Jungle #{user.first_name}!")
  end

end
