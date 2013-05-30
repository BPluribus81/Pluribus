class ContactForm < ActionMailer::Base  
  default :from => "brian.whitesides@pluribusfund.com", :to => "brian.whitesides@gmail.com"

  def contact (name, email, message, sent_at = Time.now)
    @name = name
    @email = email
    @message = message
    @sent_at = sent_at.strftime("%B %e, %Y at %H:%M")
    mail(:subject => "Email from Pluribus")
  end

end