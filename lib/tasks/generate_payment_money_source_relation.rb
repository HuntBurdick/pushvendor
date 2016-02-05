class MoneySourcePaymentRelation
  def populate
    money_sources = Payment.select(:payment_type).uniq.map(&:payment_type)
    money_sources.each do |money_source|
      MoneySource.create({:name => money_source})
    end
    Payment.all.each do |payment|
      money_source = MoneySource.find_by_name(payment.payment_type)
      payment.money_source_id = money_source.id
      payment.save
    end
  end
end