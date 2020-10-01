class RequestsController < ApplicationController
  def index
    options = {}
    options[:is_collection] = true
    tickets = current_user.requests.map do |ticket|
      ticket_serialize ticket
    end
    render json: tickets

  end
  def show
    ticket = Ticket.find(params[:id])

    render json: ticket
  end

  def accept
    ticket = Ticket.find(params[:id])
    if !ticket.accepted || ticket.status == 'CONDITIONAL_PENDING'
      ticket.accepted = true
      ticket.accepted_by_id = current_user_id
      ticket.status = 'PENDING_APPROVAL'
      ticket.save
      render json: ticket_serialize(ticket)
    end
  end

  def reject
    ticket = Ticket.find(params[:id])
    current_user.requests.remove(ticket)
  end
  private
  def ticket_serialize(ticket)
    {
      id: ticket.id,
      title: ticket.title,
      description: ticket.description,
      approved: ticket.status == 'APPROVED',
      category: ticket.subcategory.category.name,
      accepted: ticket.accepted && ticket.accepted_by_id == current_user_id,
      subcategory: ticket.subcategory.name,
      skills: ticket.skills.map {|skill| skill.name}
    }
  end
end
