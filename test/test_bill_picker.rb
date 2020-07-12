require 'minitest/autorun'
require 'byebug'
require 'bill_picker.rb'

# ruby -Ilib test/test_bill_picker.rb

describe BillPicker do
  before(:all) do
    extend BillPicker
  end

  describe 'when return should be a singular bill of a single kind' do
    it 'returns 1 R$ 10 bill for 10' do
      pick_bills(10).must_equal 'Entregar 1 nota de R$ 10,00.'
    end

    it 'returns 1 R$ 20 bill for 20' do
      pick_bills(20).must_equal 'Entregar 1 nota de R$ 20,00.'
    end

    it 'returns 1 R$ 50 bill for 50' do
      pick_bills(50).must_equal 'Entregar 1 nota de R$ 50,00.'
    end

    it 'returns 1 R$ 100 bill for 100' do
      pick_bills(100).must_equal 'Entregar 1 nota de R$ 100,00.'
    end
  end

  describe 'when return shoul be multiple bills of a single kind' do
    it 'returns 2 R$ 20 bill for 40' do
      pick_bills(40).must_equal 'Entregar 2 notas de R$ 20,00.'
    end

    it 'returns 3 R$ 100 bills for 300' do
      pick_bills(300).must_equal 'Entregar 3 notas de R$ 100,00.'
    end
  end

  describe 'when return should be multiple bill kinds' do
    it 'returns 1 R$ 20 and 1 R$ 10 bills for 30' do
      pick_bills(30).must_equal 'Entregar 1 nota de R$ 20,00 e 1 nota de R$ 10,00.'
    end

    it 'returns 1 R$ 50 and 1 R$ 10 bills for 60' do
      pick_bills(60).must_equal 'Entregar 1 nota de R$ 50,00 e 1 nota de R$ 10,00.'
    end

    it 'returns 1 R$ 50, 1 R$ 20 and 1 R$ 10 bills for 80' do
      pick_bills(80).must_equal 'Entregar 1 nota de R$ 50,00 1 nota de R$ 20,00 e 1 nota de R$ 10,00.'
    end

    it 'returns 1 R$ 50 and 1 R$ 20 bills for 90' do
      pick_bills(90).must_equal 'Entregar 1 nota de R$ 50,00 2 nota de R$ 20,00.'
    end

    it 'returns 1 R$ 100, 1 R$ 20 and 1 R$ 10 bills for 130' do
      pick_bills(130).must_equal 'Entregar 1 nota de R$ 100,00 1 nota de R$ 20,00 e 1 nota de R$ 10,00.'
    end

    it 'returns 1 R$ 100, 1 R$ 50, 1 R$ 20 and 1 R$ 10 bills for 180' do
      pick_bills(180).must_equal 'Entregar 1 nota de R$ 100,00 1 nota de R$ 50,00 1 nota de R$ 20,00 e 1 nota de R$ 10,00.'
    end

    it 'returns 2 R$ 100, 1 R$ 50 and 2 R$ 20 bills for 290' do
      pick_bills(290).must_equal 'Entregar 2 notas de R$ 100,00 1 nota de R$ 50,00 2 R$ 20.'
    end
  end

  describe "when value can't be returned by available bills" do
    it 'returns error message for 35' do
      pick_bills(35).must_equal 'Erro, impossível pagar nas notas disponíves R$ 5,00'
    end

    it 'returns error message for 42.67' do
      pick_bills(42.67).must_equal 'Erro, impossível pagar nas notas disponíves R$ 5,00'
    end
  end
end