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

end
