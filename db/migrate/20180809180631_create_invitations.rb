class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.belongs_to :user
      t.belongs_to :movie
      t.string :name
      t.timestamps
    end
  end
end
