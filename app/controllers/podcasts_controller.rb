class PodcastsController < ApplicationController

  get '/podcasts' do
    @podcasts = Podcast.all
    erb :'podcasts/index'
  end

end
