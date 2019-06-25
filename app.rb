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

get '/people/:id' do
    #show
    index=params[:id].to_i
    @person=people[index]
    erb :show
end

get '/people/new' do
    #new
end

post '/people' do
    #create
end

get '/people/:id/edit' do
    #edit
end

put '/people/' do
    #update
end

patch '/people/' do
    #update
end

delete '/people/' do
    #destroy
end