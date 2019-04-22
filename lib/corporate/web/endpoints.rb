
get '/login' do

  slim :login
end

get '/' do

  slim :index
end

get '/test' do

  slim :test, layout: false
end

