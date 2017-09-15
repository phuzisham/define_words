class Word
  attr_reader(:name, :definition)
  @@vocab = []
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @definition = attributes.fetch(:definition)
  end

  def save()
    @@vocab.push(self)
  end

  def self.find(str)
    while (x <= @@vocab.length)
      if (@@vocab[x].name == str)
        return @@vocab[x]
      end
    end
  end

  def self.sort()
    @@vocab.sort_by {|x| x.name}
  end
end
