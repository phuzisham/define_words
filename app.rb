require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  sample_word1 = Word.new({:name=>'Syzygy', :definition=>'A conjunction or opposition, especially of the moon with the sun.'})
  sample_word2 = Word.new({:name=>'Absquatulate', :definition=>'To leave somewhere abruptly.'})
  sample_word3 = Word.new({:name=>'Petrichor', :definition=>'That cool smell outside after it rains. Yep...you knew there was a word for it!'})
  sample_word4 = Word.new({:name=>'Quasar', :definition=>'A massive object in space that emits a tremendous amount of energy.'})
  sample_word5 = Word.new({:name=>'Juxtaposition', :definition=>'Two things placed side by side that contrast each other.'})
  sample_word6 = Word.new({:name=>'Xenophobia', :definition=>'Hatred or fear of foreigners or strangers or of their politics or culture.'})
  sample_word1.save
  sample_word2.save
  sample_word3.save
  sample_word4.save
  sample_word5.save
  sample_word6.save
  @words = Word.sort
  erb(:input)
end

get('/back') do
  @words = Word.sort
  erb(:input)
end

get('/output/:name') do
  @word = Word.find(params[:name])
  erb(:output)
end

post('/output') do
  @word = Word.new({:name=>params['name'],:definition=>params['definition']})
  @word.save
  @words = Word.sort
  erb(:input)
end
