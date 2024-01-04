class PaymentsController < ApplicationController
  layout 'pdf'

  def index
    @payments = Payment.all
  end

  def invoice
    @payment = Payment.find(params[:id])
  
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'Invoice', template: 'payments/invoice', format: [:html], layout: 'pdf', disposition: 'inline', show_as_html: params[:html] == 'true'
      end
    end
  end
  
end
