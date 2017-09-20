class Word
  attr_reader(:name, :definition)
  attr_accessor(:definitions)
  @@vocab = []
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @definition = attributes.fetch(:definition)
    @definitions = []
  end

  def save()
    @@vocab.push(self)
    self.definitions.push(self.definition)
  end

  def self.find(str)
    @@vocab.each do |word|
      if word.name == str
        return word
      end
    end
  end

  def self.sort()
    @@vocab.sort_by {|x| x.name}
  end

  def add_definition(str)
    self.definitions.push(str)
  end
end
