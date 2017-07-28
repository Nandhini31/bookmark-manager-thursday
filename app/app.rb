ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do
    erb :index
  end

  post '/' do
    if params[:password] == params[:password_confirmation]
      User.create(email: params[:email], password: params[:password])
      redirect '/links'
    else
      session[:error] = "Password and confirmation password do not match"
      redirect '/'
    end
  end

  get '/links' do
    @user = User.all.last ? User.all.last.email : "User not found"
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new
  end

  post '/links' do
    link = Link.create(url: params[:url],title:  params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect '/links'
  end

  post '/tags' do
    @search_term = params[:search]
    tag = Tag.first(name: params[:search])
    @links = tag ? tag.links : []
    erb :tags
  end
end
