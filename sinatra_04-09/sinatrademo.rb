require 'rubygems'
require 'sinatra'

configure :production do
  set :views, Proc.new { File.join(root, "productionviews") }
end

get '/' do
  # Show something here :)
  haml :index
end

post '/' do
  # Create something
end

put "/" do
  # Update
end

delete "/" do
  # Kill!
end

get '/event/:id' do
  # matches "GET /event/:id"
  haml "%h1 You requested event ##{params[:id]}"
end

get '/download/*.*' do
  # matches /download/path/to/file.xml
  haml "%h1 Requested parameters
#{params[:splat].inspect}"
end

get '/file/*' do
  haml "%h1 Find the file with path
:plain
  #{params[:splat]}"
end

get %r{/hello/([\w]+)} do
  haml "%h1 Hello, #{params[:captures].first}!"
end

#not_found do
#    haml "%h1 This is nowhere to be found
#%p The page you were looking for could not be located I'm afraid :("
#end

use Rack::Auth::Basic do |username, password|
  [username, password] == ['admin', 'admin']
end
