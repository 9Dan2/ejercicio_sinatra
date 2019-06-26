require 'sinatra'
require 'sinatra/activerecord'
set :database, "sqlite3:project-name.sqlite3"
Dir[__dir__+"/models/*.rb"].each {|file| require file }


people=[]

persona1 = Person.new("daniel", "bolivar", 27) #intansiar es crear un objeto

people << persona1

get '/people' do  #index
        @people = people
        erb :index
end
get '/people/new' do
    erb :new
end

get '/people/:id' do
    #show
    index=params[:id].to_i
    @person=people[index]
    erb :show
end



post '/people' do
    person = Person.new(params[:nombre],params[:apellido],params[:edad])
    people << person
    redirect "/people/#{people.length - 1}"
end

get '/people/:id/edit' do
    @id = params[:id].to_i
    @person = people[params[:id].to_i]
    erb :edit
end

put '/people/:id' do
    person = people[params[:id].to_i]
    person.nombre = params[:nombre]
    person.apellido = params[:apellido]
    person.edad = params[:edad]
    redirect "/people/#{params[:id]}"
end

patch '/people/' do
    #update
end

delete '/people/:id' do
    people.delete_at(params[:id].to_i)
    redirect "/people"
end