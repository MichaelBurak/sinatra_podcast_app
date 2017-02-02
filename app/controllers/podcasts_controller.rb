class PodcastsController < ApplicationController

  get '/podcasts' do
    authenticate_user
    @podcasts = Podcast.all
    erb :'podcasts/index'
  end

  get '/podcasts/new' do
    authenticate_user
    erb :'podcasts/create_podcast'
  end

  post '/podcasts' do
    authenticate_user
    if params[:name] == "" then
      redirect '/error'
    end
    @podcast = current_user.podcasts.create(name: params[:name], listened: params[:listened])
    redirect '/podcasts'
  end

  get '/podcasts/:id' do
    authenticate_user
    @podcast = Podcast.find_by_id(params[:id])
    erb :'podcasts/show'
  end

  get '/podcasts/:id/edit' do
    authenticate_user
    @podcast = Podcast.find_by_id(params[:id])
    if @podcast.user_id == current_user.id
      erb :'podcasts/edit'
    else
      redirect '/podcasts'
    end
  end


  patch '/podcasts/:id' do
    authenticate_user
    if params[:name] == "" then
      redirect '/error'
    end
      @podcast = Podcast.find_by_id(params[:id])
      if @podcast.user_id == current_user.id then
      @podcast.name = params[:name]
      @podcast.listened = params[:listened]
      @podcast.save
      redirect to "/podcasts/#{@podcast.id}"
    else redirect '/podcasts'
    end
  end

  delete '/podcasts/:id' do
    authenticate_user
    @podcast = Podcast.find_by_id(params[:id])
    if @podcast.user_id == current_user.id
    @podcast.delete
    redirect to '/podcasts'
  else redirect to '/login'
  end
end

  get '/error' do
    erb :'podcasts/error'
  end
end
