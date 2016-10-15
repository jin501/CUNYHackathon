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
<<<<<<< HEAD
      user = User.create(username: params[:username], password: params[:password], full_name: params[:full_name], email: params[:email])
      user.save
      session[:user_id] = user.id
      ##flash message 'new user successfully created'
      redirect '/buckets'
=======
      user = User.create(username: params[:username], password: params[:password], name: params[:name], email: params[:email])
      user.save
      session[:user_id] = user.id
      ##flash message 'new user successfully created'
      redirect "/users/#{@user.slug}"
>>>>>>> 9b04b22d445e8dd5739b313bc5b82ac6a177e29b
    # else
    #   redirect '/failure'
    end
  end

  get '/login' do
    if logged_in?
<<<<<<< HEAD
      redirect to '/buckets'
=======
      redirect to "/users/#{@user.slug}"
>>>>>>> 9b04b22d445e8dd5739b313bc5b82ac6a177e29b
    else
      erb :'/users/login'
    end
  end

<<<<<<< HEAD


=======
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
    erb :'/users/profile'
  end

  post '/users/:slug' do
    #some logic here
    #redirect to a view page erb :users/show
  end

  post '/logout' do

  end

  post '/users/advice' do

    redirect to '/users/advice'
  end

  get '/users/advice' do
    erb :'/users/advice'
  end
>>>>>>> 9b04b22d445e8dd5739b313bc5b82ac6a177e29b


end
