module SessionHelper

    def validate_admin
        if !current_user.try(:admin?)
          respond_to do |format|
            format.html { redirect_to root_path, alert: 'Necesita permisos de administrador para la solicitud requerida' }
            format.json { head :no_content }
          end
        end
    end

end
