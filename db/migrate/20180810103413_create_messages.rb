class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.belongs_to :room, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
