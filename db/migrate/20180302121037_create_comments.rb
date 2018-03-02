class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.belongs_to :user, foreign_key: true
      t.belongs_to :memo, foreign_key: true

      t.timestamps
    end
  end
end
