module ApplicationHelper

	def raw_sales
		sales = Sale.all
		total = 0.00
		for sale in sales
			unless sale.total_amount.blank?
				total += sale.total_amount
			end
		end
		return total
	end

	def raw_expenses
		Expense.all.map {|x| x.amount}.inject(:+)
	end

	def balance
		raw_balance = raw_sales - raw_expenses
		raw_balance > 0 ? content_tag(:span, number_to_currency(raw_balance), class: 'label label-success') : content_tag(:span, number_to_currency(raw_balance), class: 'label label-danger')
	end


	def payment_total
		payments = Payment.all
		payment_total = 0.00
		for payment in payments
			payment_total += payment.amount.blank? ? 0.00 : payment.amount_after_change
		end
		return payment_total
	end


	def owed_balance
		raw_sales - payment_total
	end


	def sales_total_today
		total = 0.00
		sales = Payment.where("created_at >= ?", Time.zone.now.beginning_of_day)
		for sale in sales
			total += sale.amount
		end
		return total
	end

	def get_http(url)
    unless url.blank? || url.starts_with?("http://") || url.starts_with?("https://")
      url = "http://" + url
    end
    url
  end


end
