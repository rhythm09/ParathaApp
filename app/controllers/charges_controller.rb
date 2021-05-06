class ChargesController < ApplicationController
def new
end

def create
# Amount in cents
@amount = 1000

customer = Stripe::Customer.create(
:email => params[:stripeEmail],
:source => params[:stripeToken]
)

charge = Stripe::Charge.create(
:customer => customer.id,
:amount => @amount,
:description => "",
:currency => "inr",
# :address => ["city" => "indore", "country" => "india", "line1" => "187", "line2" => "", "postal_code" => "452005", "state" => "madhya pradesh"]
)

rescue Stripe::CardError => e
flash[:error] = e.message
redirect_to new_charge_path
end
end
