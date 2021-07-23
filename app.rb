require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require './lib/bookmark'
require './lib/comment'
require './database_connection_setup'
require 'uri'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello!'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:"bookmarks/index")
  end

  get '/bookmarks/new' do
    erb(:"bookmarks/new")
  end

  post '/bookmarks' do
    unless Bookmark.create(url: params[:url], title: params[:title])
      flash[:notice] = "You must submit a valid URL." 
    end
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb(:"bookmarks/edit")
  end
  
  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark_id = params[:id]
    erb(:"comments/new")  
  end

  post '/bookmarks/:id/comments' do
    Comment.create(text: params[:comment], bookmark_id: params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
