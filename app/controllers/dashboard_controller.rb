class DashboardController < ApplicationController
  def index
  	@recent_sales = begin Sale.find(:all, :limit => 10, :order => 'id DESC') rescue [] end
  	@popular_items = begin Item.find(:all, :limit => 10, :order => 'amount_sold DESC') rescue [] end
  end

  def create_sale_with_product
		@sale = Sale.create
		item = Item.find(params[:item_id])
		LineItem.create(:item_id => params[:item_id].to_i, :quantity => params[:quantity].to_i, :price => item.price, :total_price => item.price * params[:quantity].to_i, :sale_id => @sale.id)
    
		price = (item.price * params[:quantity].to_i )

    @sale.tax = price * get_tax_rate
    @sale.amount = price
    @sale.total_amount = price + (price * get_tax_rate)
    @sale.save

    redirect_to :controller => 'sales', :action => 'edit', :id => @sale.id
	end

	def get_tax_rate
    if @configurations.tax_rate.blank?
      return 0.00
    else
      return @configurations.tax_rate.to_f * 0.01
    end
  end

end
