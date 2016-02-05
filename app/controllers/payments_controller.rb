class PaymentsController < ApplicationController

	def make_payment
		@sale = Sale.find(params[:payments][:sale_id])
		payment = Payment.create(:money_source_id => params[:payments][:money_source_id], :amount => params[:payments][:amount], :sale_id => params[:payments][:sale_id])
    set_money_sources
  	respond_to do |format|
      format.js
    end
  end
  
  private
  def payment_params
    params.require(:payment).permit(:money_source_id, :amount, :sale_id)
  end

  def set_money_sources
    @money_sources = []
    MoneySource.all.map {|x| @money_sources << [x.name, x.id] }
  end
end
