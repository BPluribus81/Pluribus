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
    @name = ''
    @email = ''
    @message = ''
  end

  def sendmail
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    if validate(@name, @email, @message)
      ContactForm.contact(@name, @email, @message).deliver
      #if request.xhr?
        flash[:success] = "Message sent successfully"
      #else
      #  flash.now[:error] = "Unkown error ocurred, please try again later"
      #end
      #redirect_to root_path
      redirect_to root_path
    else
      flash.now[:error] = @error
      #redirect_to contact_path + "#flash"
      render 'root'
    end
  end

  private
    def validate(name, email, message)
      @email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      if name.blank? || email.blank? || message.blank?
        @error = "Message not sent: Required information not filled"
        return false
      elsif name.length >= 40
        @error = "Message not sent: Name must be smaller than 40 characters"
        return false
    elsif email[@email_regex].nil?
        @error = "Message not sent: Email not valid"
        return false
      else
        return true
      end
    end

end