class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end
  get '/recipes/new' do # Renders the form
    erb :new
  end

  post '/recipes' do # Creates recipe and sends it to the server
 
    name = params[:name]
    ingredients = params[:ingredients]
    cook_time = params[:cook_time]
    recipe = Recipe.create(name: name, ingredients: ingredients, cook_time: cook_time)
    redirect "/recipes/#{recipe.id}"
  end

  get '/recipes/:id' do # shows an specific recipe
    @recipe = Recipe.find(params[:id])
    erb :show
  end
   
  get '/recipes/:id/edit' do # renders a form with the data
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    id = params[:id]
    name = params[:name]
    ingredients = params[:ingredients]
    cook_time = params[:cook_time]
    recipe = Recipe.find(id)
    recipe.update(name: name, ingredients: ingredients, cook_time: cook_time)
    redirect "/recipes/#{recipe.id}"
  end

  delete '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    recipe.destroy
    erb :index
  end



end
