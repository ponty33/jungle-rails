class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com "
  layout 'mailer'

  def order_email(user, detail)
    @user = user
    @order  = detail
    mail(to: @user.email, subject: 'Order')
  end
end
