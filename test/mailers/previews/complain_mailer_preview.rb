# Preview all emails at http://localhost:3000/rails/mailers/complain_mailer
class ComplainMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/complain_mailer/comment
  def comment
    ComplainMailer.comment
  end

  # Preview this email at http://localhost:3000/rails/mailers/complain_mailer/assign
  def assign
    ComplainMailer.assign
  end

  # Preview this email at http://localhost:3000/rails/mailers/complain_mailer/resolve
  def resolve
    ComplainMailer.resolve
  end

end
