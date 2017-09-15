require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.sort
  erb(:input)
end

get('/output/:word_def') do
  @word = Word.find(params[:name])
  erb(:output)
end

# post('/output/:word_def') do
#   erb(:output)
# end

post('/output') do
  @word = Word.new({:name=>params["name"],:definition=>params["defdefinition"]})
  @word.save()
  @words = Word.sort
  erb(:input)
end
