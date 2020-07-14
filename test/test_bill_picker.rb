require 'minitest/autorun'
require 'byebug'
require 'bill_picker.rb'

# ruby -Ilib test/test_bill_picker.rb

describe BillPicker do
  before(:all) do
    extend BillPicker
  end

  describe '#bill_picker' do
    describe 'when return should be a singular bill of a single kind' do
      it 'returns 1 R$ 10 bill for 10' do
        _(pick_bills(10)).must_equal 'Entregar 1 nota de R$ 10,00.'
      end

      it 'returns 1 R$ 20 bill for 20' do
        _(pick_bills(20)).must_equal 'Entregar 1 nota de R$ 20,00.'
      end

      it 'returns 1 R$ 50 bill for 50' do
        _(pick_bills(50)).must_equal 'Entregar 1 nota de R$ 50,00.'
      end

      it 'returns 1 R$ 100 bill for 100' do
        _(pick_bills(100)).must_equal 'Entregar 1 nota de R$ 100,00.'
      end
    end

    describe 'when return shoul be multiple bills of a single kind' do
      it 'returns 2 R$ 20 bill for 40' do
        _(pick_bills(40)).must_equal 'Entregar 2 notas de R$ 20,00.'
      end

      it 'returns 3 R$ 100 bills for 300' do
        _(pick_bills(300)).must_equal 'Entregar 3 notas de R$ 100,00.'
      end
    end

    describe 'when return should be multiple bill kinds' do
      it 'returns 1 R$ 20 and 1 R$ 10 bills for 30' do
        _(pick_bills(30)).must_equal 'Entregar 1 nota de R$ 20,00 e 1 nota de R$ 10,00.'
      end

      it 'returns 1 R$ 50 and 1 R$ 10 bills for 60' do
        _(pick_bills(60)).must_equal 'Entregar 1 nota de R$ 50,00 e 1 nota de R$ 10,00.'
      end

      it 'returns 1 R$ 50, 1 R$ 20 and 1 R$ 10 bills for 80' do
        _(pick_bills(80)).must_equal 'Entregar 1 nota de R$ 50,00 1 nota de R$ 20,00 e 1 nota de R$ 10,00.'
      end

      it 'returns 1 R$ 50 and 1 R$ 20 bills for 90' do
        _(pick_bills(90)).must_equal 'Entregar 1 nota de R$ 50,00 e 2 notas de R$ 20,00.'
      end

      it 'returns 1 R$ 100, 1 R$ 20 and 1 R$ 10 bills for 130' do
        _(pick_bills(130)).must_equal 'Entregar 1 nota de R$ 100,00 1 nota de R$ 20,00 e 1 nota de R$ 10,00.'
      end

      it 'returns 1 R$ 100, 1 R$ 50, 1 R$ 20 and 1 R$ 10 bills for 180' do
        _(pick_bills(180)).must_equal 'Entregar 1 nota de R$ 100,00 1 nota de R$ 50,00 1 nota de R$ 20,00 e 1 nota de R$ 10,00.'
      end

      it 'returns 20 R$ 100, 1 R$ 50 and 2 R$ 20 bills for 2090' do
        _(pick_bills(2090)).must_equal 'Entregar 20 notas de R$ 100,00 1 nota de R$ 50,00 e 2 notas de R$ 20,00.'
      end

      it 'returns 2 R$ 100, 1 R$ 50 and 2 R$ 20 bills for 290' do
        _(pick_bills(290)).must_equal 'Entregar 2 notas de R$ 100,00 1 nota de R$ 50,00 e 2 notas de R$ 20,00.'
      end
    end

    describe "when value can't be returned by available bills" do
      it 'returns error message for 37' do
        _(pick_bills(37)).must_equal 'Erro, impossível pagar nas notas disponíves R$ 7,00'
      end

      it 'returns error message for 42.67' do
        _(pick_bills(42.67)).must_equal 'Erro, impossível retirar centavos'
      end
    end
  end

  describe '#normalize_money_string' do
    describe 'cleaning decimal part' do
      it 'works without decimal' do
        _(normalize_money_string('42')).must_equal nil
      end

      it "works with decimal and ','" do
        _(normalize_money_string('42,34')).must_equal nil
      end

      it "works with decimal and '.'" do
        _(normalize_money_string('42.34')).must_equal nil
      end
    end

    describe 'substrings around the value' do
      it 'works with R$' do
        _(normalize_money_string('R$ 42,30')).must_equal nil
      end

      it 'works without R$' do
        _(normalize_money_string('42,30')).must_equal nil
        _(pick_bills(42.67)).must_equal 'Erro, impossível retirar centavos'
      end

      it "doesn't work with another string before" do
        _(normalize_money_string('reais: 42,34')).must_equal nil
      end

      it "doesn't work with another string after" do
        _(normalize_money_string('42,34 reais')).must_equal nil
      end
    end
  end
end
