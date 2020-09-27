class TicketSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description
  has_many :skills
  belongs_to :subcategory

end
