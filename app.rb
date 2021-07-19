require 'sinatra/base'
require 'sinatra/reloader'

class BookmarkManager < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  run! if app_file == $0
end
