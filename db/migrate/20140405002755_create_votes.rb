class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :votable, polymorphic: true
      t.belongs_to
      t.timestamps
    end
  end
end


t.integer :votable_id (the id of either the question or the answer)
t.integer :votable_type ("Question" or "Answer")