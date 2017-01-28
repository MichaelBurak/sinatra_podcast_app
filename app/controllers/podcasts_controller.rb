class PodcastsController < ApplicationController

  get '/podcasts' do
    if logged_in?
    @podcasts = Podcast.all
    erb :'podcasts/index'
  else redirect '/signup'
  end
end

  get '/podcasts/new' do
    if logged_in?
      erb :'podcasts/create_podcast'
    else redirect '/signup'
    end
  end

  post '/podcasts' do
    if params[:name] == "" then
      redirect '/podcasts'
    end
    @podcast = current_user.podcasts.create(name: params[:name], watched: params[:watched])
    redirect '/podcasts'
  end

  get '/podcasts/:id' do
    if logged_in?
      @podcast = Podcast.find_by_id(params[:id])
      erb :'podcasts/show'
    else redirect '/signup'
    end
  end

  get '/podcasts/:id/edit' do
    if logged_in?
      @podcast = Podcast.find_by_id(params[:id])
    end
    if @podcast.user_id == current_user.id
      erb :'podcasts/edit'
    else redirect '/signup'
    end
  end

  patch '/podcasts/:id' do
    if params[:name] == "" then
      redirect '/podcasts'
    end
      @podcast = Podcast.find_by_id(params[:id])
      if @podcast.user_id == current_user.id then
      @podcast.name = params[:name]
      @podcast.watched = params[:watched]
      @podcast.save
      redirect to "/podcasts/#{@podcast.id}"
    else redirect '/podcasts'
    end
  end

  delete '/podcasts/:id' do
    @podcast = Podcast.find_by_id(params[:id])
    if @podcast.user_id == current_user.id
    @podcast.delete
    redirect to '/podcasts'
  else redirect to '/login'
  end
end

end
