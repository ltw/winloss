require 'parser'

describe Parser do
  {
    'Odin beat Lucas 21-7'             => ['Odin',  'Lucas', 21,  7, Date.today],
    'Odin was beaten by Lucas 14-21'   => ['Lucas', 'Odin',  21, 14, Date.today],
    'Odin beat Lucas 21-15 yesterday'  => ['Odin',  'Lucas', 21, 15, (Time.now.utc.to_date - 1)],
    'Lucas beat Odin 21-20 2012-02-01' => ['Lucas', 'Odin',  21, 20, Date.parse('2012-02-01')],
    'Odin obliterated Lucas 21-5'      => ['Odin',  'Lucas', 21,  5, Date.today]
  }.each do |phrase, values|
    context "parsing '#{phrase}'" do
      subject { Parser.parse(phrase) }

      its([:winner])       { should == values[0] }
      its([:loser])        { should == values[1] }
      its([:winner_score]) { should == values[2] }
      its([:loser_score])  { should == values[3] }
      its([:played_date])  { should == values[4] }
    end
  end

  [
    'Odin is a douche.',
    'This is not an appropriate phrase'
  ].each do |phrase|
    it 'will not parse stupid input' do
      Parser.parse(phrase).should be_nil
    end
  end
end
