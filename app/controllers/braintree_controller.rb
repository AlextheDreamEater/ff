class BraintreeController < ApplicationController

  def new
  	@currentid = params[:user_id]
  	@params = params
  	@client_token = Braintree::ClientToken.generate
  end

  def checkout

 	  total_price = 5

	  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

	  result = Braintree::Transaction.sale(
	   :amount => total_price, #this is currently hardcoded
	   :payment_method_nonce => nonce_from_the_client,
	   :options => {
	      :submit_for_settlement => true
	    }
	   )

	  if result.success?
	    redirect_to :root, :flash => { :success => "Transaction successful!" }
	  else
	    redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
	  end


	end
end