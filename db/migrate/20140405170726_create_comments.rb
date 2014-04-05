class CreateComments < ActiveRecord::Migration
  def change
    create_table :commentable do |t|
      t.string :content
      t.belongs_to :user
      t.references :commentable, polymorphic: true
      t.timestamps
    end
  end
end
