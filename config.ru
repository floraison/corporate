
require 'pp'
require 'sinatra'
require 'slim'

$: << 'lib'
require 'corporate'


configure do

  set :show_exceptions, true

  #set :port, 8080
    # seems Webrick doesn't care... Or Sinatra doesn't tell

  set :root, File.dirname(__FILE__)

  set :static, true
  set :public_folder, 'public'

  set :views, 'app/views'

  set :slim, pretty: true, indent: ''

  set :protection, :except => [ :json_csrf ]

  use Rack::Session::Pool,
    #expire_after: 4 * 3600, # 4 hours
    expire_after: 3 * 60, # 3 minutes
    #expire_after: 10,
    key: Corporate.session_key,
    same_site: :strict

  #set :sessions,
  #  :key => Corporate.session_key
  #  :expire_after => 4 * 3600, # 4 hours
  #  :secret => 'thesunshinesandwomenhavesecrets'
  #  #:domain => "localhost",
  #  #:path => '/',
end

require 'corporate/web/helpers'
require 'corporate/web/endpoints'

#require 'flack'
#require 'corporate/flor_logger'
#
#map '/flack' do
#
#  use ManageFlowCheck
#
#  run Flack::App.new('flor/', start: false)
#    # only start flor when auth credentials are available...
#end

run Sinatra::Application

