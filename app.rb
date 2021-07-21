require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello!'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:"bookmarks/show")
  end

  get '/bookmarks/new' do
    erb(:"bookmarks/new")
  end

  post '/add_bookmark' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
