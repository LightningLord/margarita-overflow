class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :user, :required => true
      t.string :title, :required => true
      t.text :body, :required => true
      t.integer :vote_count, default: 0
      t.timestamps
    end
  end
end
