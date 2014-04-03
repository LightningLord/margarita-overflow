class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, :required => true
      t.text :body, :required => true
    end
  end
end
