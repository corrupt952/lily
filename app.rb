require 'sinatra'
require 'erb'
require 'json'
require 'securerandom'

set :bind, '0.0.0.0'
set :public_folder, File.dirname(__FILE__) + '/static'

Dir.mkdir('./tmp') unless Dir.exist?('./tmp')

get '/' do
  erb :index
end

post '/run' do
  content_type :json
  uuid = SecureRandom.uuid
  File.write("./tmp/#{uuid}.rb", params[:code])
  out = `docker run -v #{File.absolute_path('./tmp')}:/home/work --rm --tty corrupt952/lily #{uuid}.rb`
  File.delete("./tmp/#{uuid}.rb")
  { out: out }.to_json
end
