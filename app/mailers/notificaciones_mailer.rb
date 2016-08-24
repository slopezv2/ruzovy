class NotificacionesMailer < ApplicationMailer
    default from: "noresponder@ruzovy.com"
    layout 'mailer'
    def suscribir(correo)
        @correo = correo
        @admin = User.first
        mail(to: @admin.email, subject: 'Correo Suscrito a Ruzovy.co')
    end
    def contacto(nombre, correo, tema, mensaje)
        @nombre = nombre
        @correo = correo
        @tema = tema
        @mensaje = mensaje
        @admin = User.first
        mail(to: @admin.email, subject: 'Contacto por página Ruzovy.co')
    end
end
