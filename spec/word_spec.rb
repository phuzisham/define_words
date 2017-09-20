require('pry')
require('rspec')
require('word')

describe('Word') do
  test_word1 = Word.new({:name=>'Syzygy', :definition=>'A conjunction or opposition, especially of the moon with the sun.'})

  test_word2 = Word.new({:name=>'Absquatulate', :definition=>'To leave somewhere abruptly.'})

  test_word3 = Word.new({:name=>'Petrichor', :definition=>'A pleasant smell after the rain.'})

  describe('#initialize') do
    it('will store words and their meanings') do
      expect(test_word1.name).to(eq('Syzygy'))
      expect(test_word2.definition).to(eq('To leave somewhere abruptly.'))
    end
  end

  describe('#save') do
    @@vocab = []
    test_word1.save
    test_word2.save
    it('saves words to vocab array and pushes definition to definitions array') do
      expect(@@vocab[0]).to(eq(test_word1))
      expect(@@vocab[1]).to(eq(test_word2))
      expect(test_word2.definitions).to(eq(['To leave somewhere abruptly.']))
    end
  end

  describe('.find') do
    it('saves words to vocab array') do
      expect(Word.find('Syzygy')).to(eq(test_word1))
    end
  end

  describe('.sort') do
    it('sorts words in vocab array') do
      @@vocab = []
      test_word1.save
      test_word2.save
      expect(Word.sort).to(eq([test_word2, test_word1]))
    end
  end

  describe('#add_definition') do
    it('adds a definition to a word') do
      test_word3.save
      test_word3.add_definition('The earthy scent produced when rain falls on dry soil.')
      expect(test_word3.definitions).to(eq(['A pleasant smell after the rain.', 'The earthy scent produced when rain falls on dry soil.']))
    end
  end
end
