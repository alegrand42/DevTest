require "sinatra"
require "sinatra/reloader" if development?
require_relative "database"
require 'uri'

helpers do
  def display_image(card)
    "<img src='#{card}' height='100' width='100'>"
  end

  def setup
    @databases = DB
    @comments = COMMENTS
  end

  def attr_to_sym(params)
    Hash[params.map { |k, v| [k.to_sym, v] }]
  end

  def select_key(hash)
    hash.select{|k, v| ['title', 'content', 'rating', 'photo'].include? k.to_s}
  end

  def check url
    url =~ URI::regexp
  end

  def fill_empty(attributes)
    attributes.tap do |hash|
      unless hash.has_key?(:rating)
        hash.merge! rating: 0
      end
      unless hash.has_key?(:content)
        hash.merge! content: 'missing'
      end
      unless hash.has_key?(:title)
        hash.merge! title: 'missing'
      end
      unless hash.has_key?(:photo)
        hash.merge! photo: 'missing'
      end
    end
  end
end

get "/" do
  @title = 'Home Page'
  setup
  erb :home
end

get "/db" do
  erb :database
end

post "/db" do
  setup
  attributes = attr_to_sym(params)
  attributes = select_key(attributes)
  attributes = fill_empty(attributes)
  @databases << attributes
  @comments << [] 
  redirect "/db/#{@databases.length - 1}"
end

get '/db/:id' do
  setup
  id = params['id'].to_i
  redirect "/db" if id >= @databases.length
  @database = @databases[id]
  @comment = @comments[id]
  erb :database_show
end

get '/db_edit/:id' do
  setup
  id = params['id'].to_i
  redirect "/db" if id >= @databases.length
  @database = @databases[id]
  @comment = @comments[id]
  erb :database_edit
end

patch '/db/:id' do |id|
  @database = @databases[id]
  attributes = Hash[params.map { |k, v| [k.to_sym, v] }]
  if @database.update_attributes(attributes)
    redirect "/db/#{id}"
  else
    redirect "/db"
  end
end

post "/comment" do
  @comments = COMMENTS
  id = params['database_id'].to_i
  @comment = @comments[id]
  @comment << params['text']
  redirect "/db/#{id}"
end
