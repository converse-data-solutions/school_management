class FeeDuesController < ApplicationController

  def index
    @fee_dues = Payment.all
  end
end
