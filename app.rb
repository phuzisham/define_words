require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.sort
  erb(:input)
end

get('/list') do
  @words = Word.sort
  erb(:list)
end

get('/output/:name') do
  @word = Word.find(params[:name])
  @definitions = @word.definitions
  erb(:output)
end

post('/output') do
  @word = Word.new({:name=>params['name'],:definition=>params['definition']})
  @word.save
  @words = Word.sort
  erb(:input)
end

post('/addDef') do
  @word = Word.find(params[:name])
  @definitions = @word.definitions
  @definitions.push(params['definition'])
  erb(:output)
end
