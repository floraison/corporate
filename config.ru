
require 'sinatra'
require 'slim'

$: << 'lib'
require 'corporate'

CORENV = ENV['CORPORATE_ENV'] || 'dev'

configure do

  #set :port, 7080
    # this is set via the command line `-p 7080`

  set :show_exceptions, true

  set :root, File.dirname(__FILE__)
  set :static, true
  set :public_folder, 'public'
  set :views, 'app/views'
  set :protection, except: [ :json_csrf ]

  use Rack::Session::Pool,
    expire_after: 1 * 3600, # 1 hour
    key: [ 'floraison_corporate', CORENV ].join('_'),
    same_site: :strict
  #set :sessions,
  #  key: [ 'floraison_corporate', CORENV ].join('_'),
  #  expire_after: 4 * 3600, # 4 hours
  #  secret: 'thesunshinesandwomenhavesecrets'
  #  #domain: "localhost",
  #  #path: '/',

  set :slim, pretty: true, indent: ''
end

#require 'flack'
#
#map '/flack' do
#
#  run Flack::App.new('flor/', start: false)
#end

run Sinatra::Application

