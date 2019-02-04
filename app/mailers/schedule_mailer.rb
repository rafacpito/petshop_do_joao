class ScheduleMailer < ApplicationMailer
  default from: 'vetjoao@example.com'

  def scheduled_email
    @schedule = params[:schedule]
    mail(to: @schedule.owner_email, subject: 'Agendamento feito com sucesso!')
  end
end
