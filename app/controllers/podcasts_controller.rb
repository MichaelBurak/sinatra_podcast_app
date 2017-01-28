class PodcastsController < ApplicationController

  get '/podcasts' do
    if logged_in?
    @podcasts = Podcast.all
    erb :'podcasts/index'
  else redirect '/signup'
  end
end

  get '/podcasts/:id' do
    if logged_in?
      @podcast = Podcast.find_by_id(params[:id])
      erb :'podcasts/show'
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
    @podcast = current_user.podcasts.create(name: params[:name], watched: params[:watched])
    redirect '/podcasts'
  end


end
