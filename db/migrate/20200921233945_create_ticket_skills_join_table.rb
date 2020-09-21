class CreateTicketSkillsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :tickets, :skills do |t|
      t.index :ticket_id
      t.index :skill_id
    end
  end
end
