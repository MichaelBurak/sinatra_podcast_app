class UsersController < ApplicationController

  get '/signup' do
   if logged_in? then
      redirect '/podcasts'
    else
    erb :'users/signup'
  end
end

  post '/signup' do
    @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/podcasts'
    else redirect '/signup'
      end
    end

  get '/login' do
    if logged_in? then
      redirect '/podcasts'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/podcasts'
    else
      redirect '/signup'
    end
  end

  get "/logout" do
    session.clear
    redirect "/login"
  end

end
