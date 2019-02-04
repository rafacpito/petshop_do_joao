class ServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_service, only:[:destroy, :edit, :update]

  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def update
    if @service.update(service_params)
      redirect_to services_path, :flash => { :success => "Serviço atualizado com sucesso!"}
    else
      redirect_to edit_service_path, :flash => { :danger => "Erro ao atualizar serviço!"}
    end
  end

  def create
    service = Service.create(service_params)
    if service.save
      redirect_to services_path, :flash => { :success => "Serviço criado com sucesso!"}
    else
      redirect_to new_service_path, :flash => { :danger => "Erro ao criar serviço!"}
    end
  end

  def destroy
    if @service.destroy
      redirect_to services_path, flash: {success: 'Serviço excluido com sucesso!'}
    else
      redirect_to services_path, flash: {danger: 'Erro ao excluir serviço!'}
    end
  end

  private

  def service_params
    params.require(:service).permit(:name, :description, :value, :image)
  end

  def find_service
    @service = Service.find(params[:id])
  end
end
