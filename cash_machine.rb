require './lib/bill_picker.rb'
extend BillPicker

money = ARGV[0]

if money.nil?
  puts 'por favor insira a quantidade de dinheiro desejada.'
  money = gets.chomp
end

puts pick_bills(
  normalize_money_string(money)
)
