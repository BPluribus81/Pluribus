class HomeController < ApplicationController
  def index
  end

  def tou
  end

  def privacy
  end

  def raisefunds
  end

  def about
  end

  def contact
    @title = "Contact"
    @sender = ''
    @subject = ''
    @message = ''
  end

  def sendmail
    @sender = params[:sender]
    @subject = params[:subject]
    @message = params[:message]
    if validate(@sender, @subject, @message)
      UserMailer.contact(@sender, @subject, @message).deliver
      #if request.xhr?
        flash[:success] = "Message sent successfully"
      #else
      #  flash.now[:error] = "Unkown error ocurred, please try again later"
      #end
      #redirect_to contact_path
      redirect_to contact_path
    else
      flash.now[:error] = @error
      #redirect_to contact_path + "#flash"
      render 'contact'
    end
  end

  private
    def validate(sender, subject, message)
      @email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      if sender.blank? || subject.blank? || message.blank?
        @error = "Message not sent: Required information not filled"
        return false
      elsif subject.length >= 50
        @error = "Message not sent: Subject must be smaller than 50 characters"
        return false
    elsif sender[@email_regex].nil?
        @error = "Message not sent: Email not valid"
        return false
      else
        return true
      end
    end

end