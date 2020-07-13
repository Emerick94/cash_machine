module BillPicker
  require 'active_support/inflector'

  def pick_bills(money)
    return 'Erro, impossível retirar um valor negativo' if money < 0
    return 'Erro, impossível retirar centavos' if money.to_f != money.to_i

    hundred_bills, rest = money.divmod(100)
    fifty_bills, rest = rest.divmod(50)
    twenty_bills, rest = rest.divmod(20)
    ten_bills, rest = rest.divmod(10)

    return "Erro, impossível pagar nas notas disponíves R$ #{rest},00" if rest > 0

    response = 'Entregar '
    response << "#{pluralize_bill(hundred_bills)} de R$ 100,00 " if hundred_bills.positive?
    response << "#{pluralize_bill(fifty_bills)} de R$ 50,00 " if fifty_bills.positive?
    response << "#{pluralize_bill(twenty_bills)} de R$ 20,00 " if twenty_bills.positive?
    response << "#{pluralize_bill(ten_bills)} de R$ 10,00" if ten_bills.positive?

    response = add_and(response, [hundred_bills, fifty_bills, twenty_bills, ten_bills])

    response == 'Entregar ' ? response << '0 notas.' : response.strip << '.'
  end

  private

  # this is a simplification of rails pluralize()
  # https://apidock.com/rails/ActionView/Helpers/TextHelper/pluralize

  def pluralize_bill(count)
    word = if count == 1
             'nota'
           else
             'notas'
           end

    "#{count} #{word}"
  end

  def add_and(response, bill_counts)
    kind_counter = 0
    bill_counts.each do |bill_count|
      kind_counter += 1 if bill_count > 0
      break if kind_counter > 1
    end

    return response if kind_counter <= 1

    last_count = bill_counts.reverse.find { |count| count > 0 }
    response.sub(/.*\K(#{last_count} nota)/, 'e \1')
  end
end
