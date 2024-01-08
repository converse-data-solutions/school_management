class PaymentsController < ApplicationController
  layout 'pdf'
  include AuthorizationHelper
  before_action :check_admin_role

  before_action :set_invoice_data, only: [:invoice]

  def index
    @payments = Payment.all
  end

  def invoice
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'Invoice', template: 'payments/invoice', format: [:html], layout: 'pdf', disposition: 'inline',
               show_as_html: params[:html] == 'true'
      end
    end
  end

  private

  def set_invoice_data
    @payment = Payment.find_by(id: params[:id])
    @academic_fee = @payment.academic_fee
    @academic_detail = @academic_fee.academic_detail
    @student = @academic_detail.student
    @section = @student.section
    @standard = @section.standard
    @school = School.last
  end
end
