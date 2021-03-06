class ContactController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    Contact.create(contact_params)
    redirect_to("#{request.referer}contact/thanks", allow_other_host: true)
  end

  def index
    @contacts = Contact.all
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :episode, :content)
  end
end
