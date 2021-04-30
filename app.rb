require 'sinatra'
require 'yaml/store'

Choices = {
  'PHP' => 'PHP',
  'PY' => 'Python',
  'RB' => 'Ruby',
  'HS' => 'Haskell'
}

get '/' do
   @title = 'Welcome to the Jungle!'
   erb :index
end

post '/action' do
  @title = 'You are welcome!'
  @vote  = params['vote']
  @store = YAML::Store.new 'votes.yml'
  @store.transaction do
    @store['votes'] ||= {}
    @store['votes'][@vote] ||= 0
    @store['votes'][@vote] += 1
  end
  erb :cast
end


get '/results' do
  @title = 'Results so far:'
  @store = YAML::Store.new 'votes.yml'
  @votes = @store.transaction { @store['votes'] }
  erb :results
end
