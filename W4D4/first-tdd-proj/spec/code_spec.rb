require 'code'

describe Array do 
  describe '#uniq' do
    it "removes duplicates from an Array" do
      expect([1, 1, 2, 3, 7, 7].my_uniq).to eq([1, 2, 3, 7])
    end
  end

  describe "#two_sum" do
    it "finds all pairs of positions where the
        elements at those positions sum to zero" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end


  describe "#my_transpose" do
    it "will convert between the row-oriented
        and column-oriented representations" do

      a = [[0, 1, 2],
           [3, 4, 5],
           [6, 7, 8]]
           
      b = [[0, 3, 6],
           [1, 4, 7],
           [2, 5, 8]]

      expect(a.my_transpose).to eq(b)
    end
  end

end

describe "#stock_picker" do
  subject(:stocks) { [8, 5, 3, 9, 6, 7, 2] }

  it "picks the most profitable pair of days 
        to buy and sell, respectively" do
        expect(stock_picker(stocks)).to eq([2,3])
  end



end
