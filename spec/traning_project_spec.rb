RSpec.describe TraningProject do
  around(:each, :digit.eql?(15)) do |example|
    puts '------------------------------'
    example.run
    puts '+++++++++++++++++++++++++++++'
  end

  context 'some',  do
    it "has a version number", story: 'my story', digit: 15 do
      puts 'mama'
      expect('mama').to eq('maa')
      expect('mama').to eq('mam')
    end
  end

  context 'second' do
    it "has a version number", story: 'my story', digit: 13 do
      puts 'mama'
      expect('mama').to eq('mama')
    end
  end
end
