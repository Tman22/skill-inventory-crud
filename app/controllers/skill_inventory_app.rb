# require 'models/skill_inventory'
require 'pony'
class SkillInventoryApp < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')
  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/skills' do
    @skills = SkillInventory.all
    erb :index
  end

  get '/skills/new' do
    erb :new
  end

  post '/skills' do
    SkillInventory.create(params[:skill])
    Pony.mail({:to => 'tmoore2272@gmail.com',
              :from => 'tmoore2272@gmail.com',
              :subject => "I AM BATMAN!!!!",
              :body => params[:skill][:details]})
    redirect '/skills'
  end

  get '/skills/:id' do |id|
    @skill = SkillInventory.find(id.to_i)
    erb :show
  end

  get '/skills/:id/edit' do |id|
    @skill = SkillInventory.find(id.to_i)
    erb :edit
  end

  put '/skills/:id' do |id|
    SkillInventory.update(id.to_i, params[:skill])
    redirect "/skills/#{id}"
  end

  delete '/skills/:id' do |id|
    SkillInventory.delete(id.to_i)
    redirect '/skills'
  end

  not_found do
    erb :error
  end

end
