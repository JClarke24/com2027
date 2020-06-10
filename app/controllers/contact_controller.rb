class ContactController < ApplicationController
  def contact
  end
  def new
    @contact = Contact.new(params)
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
  redirect_to root_path, notice: 'Message sent successfully'
    else
      flash.now[:error] = 'Cannot send message'
      render :new
    end
    @contact_form = Contact.new(params[:contact_form])
    @contact_form.request = request
  end
end
