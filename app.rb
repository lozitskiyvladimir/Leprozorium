#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

def init_db
	@db = SQlite3::Database.new 'leprozorium.db'
	@db.results_as_hash = true
end

before do

end
get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end


get '/new' do

	erb :new
end
post "/new" do
	content = params[:content]
	erb " #{content}"
end