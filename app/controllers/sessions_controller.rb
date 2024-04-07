class SessionsController < ApplicationController
  layout 'pub'

  def new
  end

  def create
    @person = Person.auth(params[:email], params[:password])

    raise NotAuthenticated if !@person

    session[:id] = person.id
    session[:name] = person.name
    session[:admin] = person.admin

    flash[:notice] = "Olá, #{person.name}!"

    redirect_to people_url
  end

  def destroy
    session[:id] = nil

    redirect_to new_session_url
  end
end
