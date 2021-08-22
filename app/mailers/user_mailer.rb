class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail to: @user.email, subject: I18n.t('user_mailer.welcome.subject')
  end

  def export_resume(user, position)
    @user = user
    zip_name = "#{SecureRandom.alphanumeric(10)}-curriculos.zip"
    ExportResume.new(user, position, zip_name).generate
    attachments[zip_name] = File.read(Rails.root.join('tmp', zip_name).to_s)
    mail to: @user.email, subject: 'Todos os currículos foram exportados'
    File.delete(Rails.root.join('tmp', zip_name).to_s)
  end
end
