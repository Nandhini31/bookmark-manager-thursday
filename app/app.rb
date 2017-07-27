ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'models/link.rb'
require_relative 'data_mapper_setup'


class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new
  end

  post '/links' do
    link = Link.create(url: params[:url],title:  params[:title])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
      redirect '/links'
  end

  post '/bubbles' do
    @search_term = params[:search]
    tag = Tag.first(name: params[:search])
    p tag
    @links = tag ? tag.links : []
    p @links
    erb :bubbles
  end



end
