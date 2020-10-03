class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end


  def create
    @contact = Contact.new(contact_params)
    if @contact.save!
      ContactMailer.contact_mail(@contact).deliver
      flash[:notice] = '問い合わせメール送信完了'
      redirect_to root_path
    else
      render 'new'
    end
  end
  

  private
  def contact_params
    params.permit
    params.require(:contact).permit(:name, :mail, :message)
  end
  
end
