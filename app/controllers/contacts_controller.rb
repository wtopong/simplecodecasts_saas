class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        
        if @contact.save
            flash[:success] = "Message sent."
            redirect_to new_contact_path
        else
            flash[:danger] = "Error occured, mesage has not been sent."
            redirect_to new_contact_path
        end
    end
    
    private
        def contact_params
            # for secured reson we have to write a line of code below 
            # to 'white list' any form fields when saving to your db for security purposes.
            params.require(:contact).permit(:name, :email, :comments)
        end
end