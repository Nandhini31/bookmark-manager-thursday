ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'


class BookmarkManager < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/' do
    User.create(email: params[:email], password: params[:password])
    redirect '/links'
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

  post '/bubbles' do
    @search_term = params[:search]
    tag = Tag.first(name: params[:search])
    @links = tag ? tag.links : []
    erb :bubbles
  end



end
