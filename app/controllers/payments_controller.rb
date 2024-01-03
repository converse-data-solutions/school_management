class PaymentsController < ApplicationController
  layout 'payment'
  def index
    @payments = Payment.all
  end

  def invoice
    @payment = Payment.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'Invoice', template: 'payments/invoice', format: [:html], layout: 'payment'
      end
    end
  end
end
