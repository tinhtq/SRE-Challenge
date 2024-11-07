require 'sinatra'
require 'json'

def parse_gift(raw)
  parsed = JSON.parse(raw)
  parsed['gift']
end

get '/' do
  "Welcome to the Simpson household"
end

get '/homer' do
  "I hope you brought donuts"
end

post '/homer' do
  gift = parse_gift(request.body.read)
  if gift == 'donut'
    [200, 'Woohoo']
  else
    [400, "D'oh"]
  end
end

###################################
# FIXME: Implement Lisa endpoints #
###################################
get '/lisa' do
  "Hello! I’m Lisa. Have you brought me a book?"
end

post '/lisa' do
  gift = parse_gift(request.body.read)
  if gift == 'book'
    [200, 'Thank you! I love reading.']
  else
    [400, "That's thoughtful, but I prefer books."]
  end
end