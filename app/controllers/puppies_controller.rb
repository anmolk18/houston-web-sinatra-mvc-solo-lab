class PuppiesController < ApplicationController
   
    # display list of all the puppies
    get '/puppies' do 
        @puppies = Puppy.all
        erb :index 
    end

    # Form for creating a puppy
    get '/puppies/new' do 
        erb :new
    end

    # display single puppy info
    get '/puppies/:id' do 
        @puppy = find_puppy(params)
        erb :show 
    end 

    # Create a puppy 
    post '/puppies' do 
        puppy = Puppy.create(params)
        redirect "/puppies/#{puppy.id}"
    end 

    # Form for editing an existing puppy
    get '/puppies/:id?edit' do 
        @puppy = find_puppy(params)
        erb :edit 
    end 

    # Edit an existing puppy 
    patch '/puppies/:id' do 
        puppy = find_puppy(params) 
        puppy.update(name: params[:name], breed:params[:breed])
        redirect "/puppies/#{puppy.id}"
    end 

    # Delete an existing puppy 
    delete '/puppies/:id' do 
        puppy = find_puppy(params)
        puppy.destroy 
        redirect "/puppies"
    end 

    def find_puppy(params) 
        Puppy.find(params[:id])
    end 

end