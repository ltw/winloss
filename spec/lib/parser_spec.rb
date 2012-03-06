require 'parser'

describe Parser do
  {
    'Odin beat Lucas 21-7'             => ['Odin',  'Lucas', 21,  7, Date.today],
    'Odin was beaten by Lucas 14-21'   => ['Lucas', 'Odin',  21, 14, Date.today],
    'Odin beat Lucas 21-15 yesterday'  => ['Odin',  'Lucas', 21, 15, (Time.now.utc.to_date - 1)],
    'Lucas beat Odin 21-20 2012-02-01' => ['Lucas', 'Odin',  21, 20, Date.parse('2012-02-01')],
    'Odin obliterated Lucas 21-5'      => ['Odin',  'Lucas', 21,  5, Date.today]
  }.each do |test_case|
    it "parses '#{test_case[0]}'" do
      Parser.parse(test_case[0]).values.each_with_index do |v, i|
        test_case[1][i].should == v
      end
    end
  end
end
