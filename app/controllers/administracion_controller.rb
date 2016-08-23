class AdministracionController < ApplicationController
  include ApplicationHelper
  layout 'administracion'
  def autenticar
    parameters = login_params
    puts parameters
    if user = User.find_by(email: parameters[:inputEmail])
      if user.password == parameters[:inputPassword]
        session[:user_id] = user.id
         redirect_to administracion_fotos_url
      else
        flash[:error] = "Clave Incorrecta"
        redirect_to administracion_login_url
      end

    else
      flash[:error] = "Datos incorrectos"
      redirect_to administracion_login_url
    end
  end

  def agregar_fotos
    check_authentication
  end

  def fotos
    check_authentication
  end

  def login
  end

  private 
  
  def login_params
    params.permit(:inputPassword, :inputEmail)
  end

end

