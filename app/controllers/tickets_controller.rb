class TicketsController < ApplicationController
  def index
    options = {}
    options[:is_collection] = true
    tickets = current_user.tickets.map do |ticket|
      ticket_serialize(ticket)
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
    ticket.status = 'SUBMITTED'
    ticket.save
    params[:skills].each do |id|
      skill = Skill.find(id)
      ticket.skills << skill
      skill.users.each do |user|
        begin
          user.requests << ticket
        rescue

        end
      end
    end
    render json: {success: true, ticket: ticket_serialize(ticket) }
  end
  def update

  end
  def destroy
    ticket = Ticket.find(params[:id])
    ticket.destroy
    render json: {success: true}
  end
  def approve
    ticket = Ticket.find(params[:id])
    if ticket.status == 'PENDING_APPROVAL' || ticket.status == 'CONDITIONAL_PENDING'
      ticket.status = 'APPROVED'
      ticket.save
      ticket.providers.each do |user|
        begin
          user.requests.remove(ticket)
        rescue
        end
      end
    end
    render json: ticket_serialize(ticket)
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
  def ticket_serialize(ticket)
    {
      id: ticket.id,
      title: ticket.title,
      approved: ticket.status == 'APPROVED',
      description: ticket.description,
      category: ticket.subcategory.category.name,
      accepted: ticket.accepted && ticket.accepted_by_id == current_user_id,
      subcategory: ticket.subcategory.name,
      skills: ticket.skills.map {|skill| skill.name}
    }
  end
end
