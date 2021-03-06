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

      its([:winner_name])  { should == values[0] }
      its([:loser_name])   { should == values[1] }
      its([:winner_score]) { should == values[2] }
      its([:loser_score])  { should == values[3] }
      its([:played_date])  { should == values[4] }
    end
  end

  it 'will not parse stupid input' do
    Parser.parse('Odin wins too much.').should be_nil
  end

  {
    'Adrian + Odin beat Lucas + Nate 21-7'            => ['Adrian + Odin',  'Lucas + Nate', 21,  7, Date.today],
    'Adrian + Odin were beaten by Lucas + Nate 14-21' => ['Lucas + Nate', 'Adrian + Odin',  21, 14, Date.today],
    'Nate + Odin beat Adrian + Lucas 21-15 yesterday' => ['Nate + Odin',  'Adrian + Lucas', 21, 15, (Time.now.utc.to_date - 1)],
    'Lucas + Tate beat Nate + Odin 21-20 2012-02-01'  => ['Lucas + Tate', 'Nate + Odin',  21, 20, Date.parse('2012-02-01')],
  }.each do |phrase, values|
    context "parsing '#{phrase}'" do
      subject { Parser.parse(phrase) }

      its([:winner_name])  { should == values[0] }
      its([:loser_name])   { should == values[1] }
      its([:winner_score]) { should == values[2] }
      its([:loser_score])  { should == values[3] }
      its([:played_date])  { should == values[4] }
    end
  end
end
