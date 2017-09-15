require('pry')
require('rspec')
require('word')

describe('Word') do
  test_word1 = Word.new({:name=>'Syzygy', :definition=>'A conjunction or opposition, especially of the moon with the sun.'})

  test_word2 = Word.new({:name=>'Absquatulate', :definition=>'To leave somewhere abruptly.'})

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
    it('saves words to vocab array') do
      expect(@@vocab[0]).to(eq(test_word1))
      expect(@@vocab[1]).to(eq(test_word2))
    end
  end

  describe('.find') do
    it('saves words to vocab array') do
      expect(Word.find('Syzygy')).to(eq(test_word1))
    end
  end

  describe('.sort') do
    it('sorts words in vocab array') do
      expect(Word.sort).to(eq(Word.sort))
    end
  end
end
