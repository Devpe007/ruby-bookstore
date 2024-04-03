class MagicController < LoggedController 
    before_action :logged?, only: [:index]
    before_action :set_references
    before_action :set_collection, only: [:index]
    before_action :set_resource, only: [:show, :edit, :update, :destroy, :changed]

    respond_to :html

    def index
        respond_with instance_variable_get("@#{@plural_ref}")
    end

    def show
    end
    
    def new
        respond_with instance_variable_set("@#{@singular_ref}", Object.const_get(@singular_ref.camelize).new)
    end

    def create
        resource = instance_variable_set("@#{@singular_ref}", Object.const_get(@singular_ref.camelize).new(send(@params)))

        flash[:notice] = "Registro de #{@name_ref.downcase} salvo" if resource.save

        respond_with resource
    end

    def update
        resource = instance_variable_get("@#{singular_ref}")

        flash[:notice] = "Registro #{@name_ref.downcase} atualizado" if resource.update(send(@params))

        respond_with resource
    end
    
    def edit
    end

    def destroy
        resource = instance_variable_get("@#{singular_ref}")

        flash[:notice] = "Registro de #{name_ref.downcase} apagado" if resource.destroy
    end

    private

    def set_references
        @plural_ref = /([a-z]+)(_)?(controller)?/.match(controller_name)[1]
        @singular_ref = @plural_ref.singularize
        @params = "#{@singular_ref}_params"
        @name_ref = I18n.translate("activerecord.models.#{@singular_ref}")
    end

    def set_collection
        instance_variable_set("@#{@plural_ref}", Object.const_get(@singular_ref.camelize).all)
    end

    def set_resource
        instance_variable_set("@#{@singular_ref}", Object.const_get(@singular_ref.camelize).find(params[:id]))
    end
end