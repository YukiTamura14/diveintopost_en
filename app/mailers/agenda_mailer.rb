class AgendaMailer < ApplicationMailer
  def agenda_mail(agenda, team, email)
    @agenda = agenda
    @team = team
    @email = email
    mail to: @email, subject: I18n.t('views.messages.mail_delete_agenda')
  end
end
