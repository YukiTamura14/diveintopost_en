class TeamMailer < ApplicationMailer
  def team_mail(email, team)
    @email = email
    @team = team
    mail to: @email, subject: I18n.t('mails.messages.became_team_leader') + "#{@team.name}"
  end
end
