require 'parser'

describe Parser do
  [
    {
      test: 'a standard layout',
      phrase: 'Odin beat Lucas 21-7',
      expected_values: ['Odin', 'Lucas', 21, 7, Date.today],
    },
    {
      test: 'a negative adjective',
      phrase: 'Odin was beaten by Lucas 14-21',
      expected_values: ['Lucas', 'Odin', 21, 14, Date.today],
    },
    {
      test: 'a relative date',
      phrase: 'Odin beat Lucas 21-15 yesterday',
      expected_values: ['Odin', 'Lucas', 21, 15, (Time.now.utc.to_date - 1)],
    },
    {
      test: 'a specific date',
      phrase: 'Lucas beat Odin 21-20 2012-02-01',
      expected_values: ['Lucas', 'Odin', 21, 20, Date.parse('2012-02-01')],
    },
    {
      test: 'an unusual adjective',
      phrase: 'Odin obliterated Lucas 21-5',
      expected_values: ['Odin', 'Lucas', 21, 5, Date.today]
    }
  ].each do |test_case|
    it "should parse phrase with #{test_case[:test]}" do
      Parser.parse(test_case[:phrase]).values.each_with_index do |v, i|
        test_case[:expected_values][i].should == v
      end
    end
  end
end
