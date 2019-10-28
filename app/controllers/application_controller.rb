
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  # new
  get '/articles/new' do
    erb :new
  end

  # index
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  # create
  post '/articles' do
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
  end

  # show
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end


  # edit
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  # update
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect "/articles/#{@article.id}"
  end

  #destroy
  delete '/articles/:id' do
    article = Article.find_by(id: params[:id])
    article.destroy
  end


end
