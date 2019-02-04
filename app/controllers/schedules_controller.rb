class SchedulesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def new
    @schedule = Schedule.new
  end

  def create
    schedule = Schedule.create(schedule_params)
    if schedule.save
      ScheduleMailer.with(schedule: schedule).scheduled_email.deliver_now
      redirect_to root_path, :flash => { :success => "Agendamento feito com sucesso!"}
    else
      redirect_to root_path, :flash => { :danger => "Erro ao tentar realizar o agendamento!"}
    end
  end

  def index
    @schedules = Schedule.all
  end

  private

  def schedule_params
    params.require(:schedule).permit(:owner_name, :phone, :owner_email, :date, :hour, :service_id)
  end
end
