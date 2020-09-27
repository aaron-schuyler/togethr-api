class TicketsController < ApplicationController
  def index
    options = {}
    options[:is_collection] = true
    tickets = Ticket.all.map do |ticket|
      {
        title: ticket.title,
        description: ticket.description,
        category: ticket.subcategory.category.name,
        subcategory: ticket.subcategory.name,
        skills: ticket.skills.map {|skill| skill.name}
      }
    end
    render json: tickets

  end
  def show
    ticket = Ticket.find(params[:id])

    render json: ticket
  end
  def create
    ticket = Ticket.new(ticket_params)
    ticket.user_id = current_user_id
    ticket.save
    render json: ticket
  end
  def update

  end
  def destroy
    ticket = Ticket.find(params[:id])
    ticket.destroy
  end
  def submit
    ticket = Ticket.find(params[:id])
    ticket.skills.each do |skill|
      skill.users.each do |user|
        user.requests << ticket
      end
    end
    ticket.status = 'SUBMITTED'
    ticket.save
    render json: ticket
  end
  def accept
    ticket = Ticket.find(params[:id])
    if !ticket.accepted || ticket.status == 'CONDITIONAL_PENDING'
      ticket.accepted = true
      ticket.accepted_by_id = current_user_id
      ticket.status = 'PENDING_APPROVAL'
      ticket.save
      render json: ticket
    end
  end
  def reject
    ticket = Ticket.find(params[:id])
    current_user.requests.remove(ticket)
  end
  def conditionally_accept


  end
  def approve
    ticket = Ticket.find(params[:id])
    if ticket.status == 'PENDING_APPROVAL' || ticket.status = 'CONDITIONAL_PENDING'
      ticket.status = 'APPROVED'
      ticket.save
      ticket.providers.each do |user|
        user.requests.remove(ticket)
      end
      render json: ticket
    end
  end
  def close
    ticket = Ticket.find(params[:id])
    if ticket.user_id == current_user_id
      ticket.status = 'CLOSED'
      ticket.save
      render json: ticket
    end
  end

  private
  def ticket_params
    params.require(:ticket).permit(:title, :description, :subcategory_id)
  end
end
