require './config/environment'
require_relative '../models/dog.rb'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :welcome
  end

  get "/dogs" do
    @dogs = Dog.all
    erb :dogs
  end

  get '/dogs/new' do
    erb :new
  end

  post '/dogs' do
    @age = params['age']
    @name = params['name']
    @breed = params['breed']
    Dog.create(age: @age, breed: @breed, name: @name)
    # binding.pry
    erb :dogs
  end

end
