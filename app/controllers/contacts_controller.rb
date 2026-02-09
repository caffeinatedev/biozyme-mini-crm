class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]

  def index
    @contacts = policy_scope(Contact)
  end

  def show
    authorize @contact
  end

  def new
    @contact = Contact.new
    authorize @contact
  end

  def create
    @contact = current_user.owned_contacts.build(contact_params)
    authorize @contact

    if @contact.save
      redirect_to contacts_path, notice: "Contact created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @contact
  end

  def update
    authorize @contact

    if @contact.update(contact_params)
      redirect_to contacts_path, notice: "Contact updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @contact
    @contact.destroy
    redirect_to contacts_path, notice: "Contact deleted."
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :company)
  end
end
