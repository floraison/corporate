
get '/login' do

  slim :login, layout: false
end

post '/login' do

  if u = Corporate::Cases::Login.authentify(params[:user], params[:pass])
    session[:user] = u
    redirect '/'
  else
    redirect '/login'
  end
end

before '/*' do

  redirect '/login' \
    if request.path_info != '/login' && session[:user] == nil
end

get '/logout' do

  session[:user] = nil

  redirect '/login'
end

get '/' do

  slim :index
end

get '/test' do

  slim :test, layout: false
end

get '/users/:username' do

  @username = params[:username]

  slim :user
end

get '/definitions' do

  @definitions = ENGINE.loader.definitions

  slim :definitions
end

