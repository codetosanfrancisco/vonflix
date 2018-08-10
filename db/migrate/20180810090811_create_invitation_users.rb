class CreateInvitationUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :invitation_users do |t|
      t.belongs_to :friend,class:"User"
      t.belongs_to :invitation

      t.timestamps
    end
  end
end
