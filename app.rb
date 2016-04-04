#encoding: utf-8
require 'sqlite3'
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'


def init_db
	@db = SQLite3::Database.new 'leprozorium.db'
	@db.results_as_hash = true

end

configure do
	init_db
	@db.execute 'CREATE TABLE IF NOT EXISTS
		  Posts 
		  	(
		  		id INTEGER PRIMARY KEY AUTOINCREMENT,
		  		created_date DATE,
		  		content TEXT
		  	)'
end

before do
	init_db
end
get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end


get '/new' do

	erb :new
end
post "/new" do
	content = params[:content]
		if content.length <= 0
			@error = 'Type post text'
			return erb :new	
		end
		@db.execute 'insert into Posts (created_date,content) values (datetime(),?)',[content] 

	erb " #{content}"
end













