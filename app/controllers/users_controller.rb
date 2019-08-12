class UsersController < ApplicationController
    get '/signup' do
        if !logged_in?
            flash[:signup_error] = "First timer? Sign up before signing in."
            erb :'users/signup'
          else
          erb :'/index'
          end
    end

    get '/login' do
        if logged_in?
            redirect to "/users/#{current_user.slug}"
            erb :'/users/show_user'
          else
          erb :'users/login'
        end
    end

    get '/users/:slug' do
        if @user = User.find_by_slug(params[:username])

            @material = @user
            erb :'users/show_user'
        else
            redirect to '/'
        end
    end

    post '/signup' do
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            flash[:empty_error] = "Please fill out all three fields."
            redirect to '/signup'
        else
            @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
            @user.save
            session[:id] = @user.id
            redirect to '/material'
        end
    
    end

    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user &&@user.authenticate(params[:password])
            session[:id] = @user.id
            redirect to "/material"
        else 
            redirect to '/users/login'
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect to '/login'
        else
            redirect to '/'
        end
    end

end