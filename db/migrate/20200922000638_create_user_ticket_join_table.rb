class CreateUserTicketJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :tickets, :users do |t|
      t.index :ticket_id
      t.index :user_id
    end
  end
end
