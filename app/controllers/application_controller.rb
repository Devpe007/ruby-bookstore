class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  NotAuthenticated = Class.new(StandardError)
  NotAdmin = Class.new(StandardError)

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from NotAuthenticated, with: :not_authenticated
  rescue_from NotAdmin, with: :not_admin

  def record_not_found
    flash[:notice] = "Registro não encontrado"

    redirect_to action: "index"
  end

  def not_authenticated
    flash[:notice] = "Você precisa se autenticar no sistema"

    redirect_to new_session_url
  end

  def logged?
    raise NotAuthenticated unless session[:id]
  end

  def not_admin
    flash[:notice] = "Você precisa ser administrador"

    redirect_to root_path
  end
end
