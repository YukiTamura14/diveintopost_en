class AgendaMailer < ApplicationMailer
  def agenda_mail(agenda, team, email)
    @agenda = agenda
    @team = team
    @email = email
    mail to: @email, subject: I18n.t('mails.messages.delete_agenda')
  end
end
