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

    get '/recipes/new' do
      erb :new
    end

    get '/recipes/:id' do
      id = params[:id]
      @recipe = Recipe.find(id)
      erb :show
    end

    get '/recipes/:id/edit' do
      id = params[:id]
      @recipe = Recipe.find(id)
      erb :edit
    end

    post '/recipes' do
      name = params[:name]
      ingredients = params[:ingredients]
      cook_time = params[:cook_time]
      recipe = Recipe.create(name: name, cook_time: cook_time, ingredients: ingredients)
      redirect "/recipes/#{recipe.id}"
    end

    patch '/recipes/:id' do 
      name = params[:name]
      ingredients = params[:ingredients]
      cook_time = params[:cook_time]
      recipe.update(name: name, ingredients: ingredients, cook_time: cook_time)
      # @recipe = Recipe.find(params[:id])
      redirect "/recipes/#{recipe.id}"
    end

    delete '/recipes/:id' do
      id = params[:id]
      @recipe = Recipe.find(id)
      @recipe.destroy
      redirect '/recipes'
    end




end
