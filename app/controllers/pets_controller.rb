class PetsController < ApplicationController

  get '/pets' do
    @pets = current_user.pets.all
    erb :"/pets/index"
  end

  get '/pets/new' do
    erb :"/pets/new"
  end

  post '/pets' do
    @pet = current_user.pets.create(
      name: params[:name],
      species: params[:species],
      breed: params[:breed],
      microchip_number: params[:microchip_number],
      microchip_registry: params[:microchip_registry],
      vet_name: params[:vet_name],
      vet_phone: params[:vet_phone],
      vaccinations: params[:vaccinations],
      flea_treatment_type: params[:flea_treatment_type],
      heartworm_treatment_type: params[:heartworm_treatment_type],
      allergies: params[:allergies],
      food_brand: params[:food_brand],
      food_serving: params[:food_serving],
      feedings_per_day: params[:feedings_per_day],
      comments: params[:comments])
    if @pet.save
      redirect to "/pets/#{@pet.id}"
    else
      redirect to "/pets/new"
    end
  end

  get '/pets/:id' do
    @pet = current_user.pets.find_by_id(params[:id])
    erb :'/pets/show'
  end

  get '/pets/:id/edit' do
    @pet = current_user.pets.find_by_id(params[:id])
    erb :'/pets/edit'
  end

  patch '/pets/:id' do
    @pet = current_user.pets.find_by_id(params[:id])
    @pet.name = params[:name]
    @pet.species = params[:species]
    @pet.breed = params[:breed]
    @pet.microchip_number = params[:microchip_number]
    @pet.microchip_registry = params[:microchip_registry]
    @pet.vet_name = params[:vet_name]
    @pet.vet_phone = params[:vet_phone]
    @pet.vaccinations = params[:vaccinations]
    @pet.flea_treatment_type = params[:flea_treatment_type]
    @pet.heartworm_treatment_type = params[:heartworm_treatment_type]
    @pet.allergies = params[:allergies]
    @pet.food_brand = params[:food_brand]
    @pet.food_serving = params[:food_serving]
    @pet.feedings_per_day = params[:feedings_per_day]
    @pet.comments = params[:comments]
    @pet.user_id = current_user.id
    @pet.save
    redirect to "/pets/#{@pet.id}"
  end



end
