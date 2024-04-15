class ApplicationMailer < ActionMailer::Base
  default from: 'systemcraftdevelomenttest@gmail.com'

  layout "mailer"

  ActionMailer::Base.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 587,
    domain: 'gmail.com',
    authenticatpon: 'plain',
    user_name: "systemcraftdevelomenttest@gmail.com",
    password: "ibfektpiymfavfyo",
    enable_starttls_auto: true
  }
end
