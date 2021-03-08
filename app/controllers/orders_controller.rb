class OrdersController < ApplicationController
	def create
    event = Event.find(params[:event_id])
    order  = Order.create!(event: event, amount: event.price, state: 'pending', user: current_user)
    @attendance = Attendance.new

    @user = current_user
    @attendance.user = @user
    @attendance.event = event
    @attendance.save
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: event.name,
        # images: [event.photo_url],
        amount: event.price_cents,
        currency: 'usd',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )
    authorize order
    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
   
  end
  def show
    @order = current_user.orders.find(params[:id])
    authorize @order
  end
end
