class UsersController < ApplicationController

  get '/' do
    if logged_in? 
      redirect to '/####'
    else
      erb :'/users/index'
    end
  end






end