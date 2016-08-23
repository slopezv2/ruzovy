module ApplicationHelper
    def check_authentication
        unless session[:user_id]
            flash[:error] = "Error en credenciales"
            redirect_to administracion_login_url
        end
        true
    end
    def logged?
        unless session[:user_id]
            return false
        end
        return true
    end
end
