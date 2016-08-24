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
    @images = Image.all
  end

  def cargar_imagen
    check_authentication
    @imagen = Image.new()
    parameters = cargar_imagen_params
    @imagen.url = parameters[:inputURL]
    @imagen.category = parameters[:inputCategoria]
    @imagen.description = parameters[:inputDescription]
    if @imagen.save
      flash[:success] = "Imagen guardada exitosamente"
    else
      flash[:error] = "Error en la carga de imagen"
    end
    redirect_to administracion_fotos_url
  end

  def login
  end

  def borrar_imagen
    check_authentication
    @image = Image.find_by(id: borrar_imagen_params[:id] )
    unless @image.destroy
      flash[:error] = "No se pudo borrar la imagen"      
    else  
      flash[:success] = "Imagen borrada exitosamente" 
    end
    redirect_to administracion_fotos_url
  end

  def cerrar_sesion
    session.delete(:user_id)
    redirect_to root_url
  end

  def suscripcion
    NotificacionesMailer.suscribir(suscripcion_params[:email]).deliver_now
    flash[:success] = "Suscripción completa"
    redirect_to root_url
  end
  def contacto
    parameters = contacto_params
    nombre = parameters[:nombre]
    correo = parameters[:correo]
    tema = parameters[:tema]
    mensaje = parameters[:mensaje]
    NotificacionesMailer.contacto(correo,nombre,tema,mensaje).deliver_now
    flash[:success] = "Gracias, nos estaremos comunicando con usted"
    redirect_to store_contact_url 
  end  
  private 
  
  def login_params
    params.permit(:inputPassword, :inputEmail)
  end

  def cargar_imagen_params
    params.permit(:inputCategoria, :inputURL,:inputDescription)
  end

  def borrar_imagen_params
    params.permit(:id)
  end

  def suscripcion_params
    params.permit(:email)
  end

  def contacto_params
    params.permit(:nombre, :correo, :tema, :mensaje)
  end
end

