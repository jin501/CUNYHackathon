class UsersController < ApplicationController

  get '/' do
    # binding.pry
    # if logged_in?
    #   @user = current_user
    #   redirect to "/users/#{@user.slug}"
    # else
    #   erb :'/users/index'
    # end
    erb :'/users/index'
  end

  post '/signup' do
    existing_user = User.find_by(username: params[:username])
    if existing_user
      ##flash message you have an existing account, please login
      redirect to '/login'
    # elsif existing_user.class == NilClass
    else
      user = User.create(username: params[:username], password: params[:password], name: params[:name], email: params[:email])
      user.save
      session[:user_id] = user.id
      ##flash message 'new user successfully created'
      redirect '/buckets'
    # else
    #   redirect '/failure'
    end
  end

  get '/login' do
    if logged_in?
      redirect to "/users/#{@user.slug}"
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/users/#{@user.slug}"
    else
      ##flash message "wrong credentials, please try again"
      redirect to '/login'
    end
  end

  get '/users/:slug' do
    erb :profile
  end

  post '/users'

end