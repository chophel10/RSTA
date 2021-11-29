class ComplainMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.complain_mailer.comment.subject
  #
  def comment
    @greeting = "Hi"

    mail to: params[:email], subject: "this is a test mail"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.complain_mailer.assign.subject
  #
  def assign
    @greeting = "Hi"

    mail to: params[:email], subject: "this is a test mail"
  end
end
