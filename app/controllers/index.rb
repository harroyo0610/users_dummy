before '/users/:id' do
  p session[:id]
  unless session[:id]
    redirect to('/login')
  end 
end
get '/logout' do
  session.clear
  redirect to("/")
end

get "/" do
  erb :index
end

get '/:url' do
  url = params[:url]
  if url == "register"
    erb :create_count
  elsif url == "login"
    erb :login
  end
end


get '/users/:id' do
  erb :secret_page
end

post '/register' do

  user = User.new(name: params[:user_name], email: params[:user_email], password: params[:user_password])

  if user.save
    session[:id] = user.id
    redirect to ("/users/#{user.id}")
  else
    @message_error = "El correo que ingreso ya fue registrado"
    erb :create_count    
  end
end

post '/login' do
  user = User.authenticate(params[:user_email], params[:user_password])
  if user
    session[:id] = user.id
    redirect to ("/users/#{user.id}")
  else
    @message_error = "La contraseña no es correcta o su usuario no ha sido registrado"
    erb :login
  end
end