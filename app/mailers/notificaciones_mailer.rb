class NotificacionesMailer < ApplicationMailer
    default from: "noresponder@ruzovy.com"
    layout 'mailer'
    def suscribir(correo)
        @correo = correo
        @admin = User.first
        mail(to: @admin.email, subject: 'Correo Suscrito a Ruzovy.co')
    end
end
