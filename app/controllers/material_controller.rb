class MaterialController < ApplicationController

    get '/material/new' do
        if logged_in?
            erb :'/material/new_bit'
        else
            redirect to '/login'
        end 
    end

    get '/material/:id' do 
        if logged_in?
            @material = Material.find_by_id(params[:id])
            erb :'/material/show_bit'
        else
            redirect to '/login'
        end 
    end

    get '/material/:id/edit' do 
        if logged_in? 
            @material = Material.find_by_id(params[:id])
            erb :'/material/edit_set'
        end 
    end

    get '/material' do
        if logged_in?
            @material = Material.all.find_all do |material|
              material.user_id == current_user.id
              end  
            erb :'/material/material'
        else 
            redirect to '/login'
        end
    end
    post '/material' do
        if logged_in?
            @material = Material.new(material_params)
            if @material.save
                redirect to "/material/#{@material.id}"
            else
                erb :'/material/new_bit'
            end
        else 
            redirect to '/login'
        end
    end

    patch '/material/:id' do
        @material = Material.find_by_id(params[:id])
        @material.update(material_params)
        if @material.save 
            redirect to "/material"
        else 
            erb :'/material/edit_set'
        end
    end
    
    
    delete '/material/:id/delete' do
        @material = Material.find_by_id(params[:id])
        # if logged_in? && @material.user_id == session[:id]
            @material.destroy
            redirect to '/material'
        # else 
        #     redirect to "/material/#{@material.id}"
        # end
    end

    
    private 
    def material_params
        {time: params[:time], date: params[:date], room_performed: params[:room_performed], content: params[:content], user_id: current_user.id}
    end 
end