class PodcastsController < ApplicationController

  get '/podcasts' do
    @podcasts = Podcast.all
    erb :'podcasts/index'
  end

  get '/podcasts/new' do
    erb :'podcasts/create_podcast'
  end

end
