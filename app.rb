require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  erb(:input)
end

get('/output/:word_def') do
  erb(:output)
end

post('/output/:word_def') do
  erb(:output)
end

post('/output') do
  erb(:input)
end
