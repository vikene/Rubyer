class CreateMicroblogs < ActiveRecord::Migration
  def change
    create_table :microblogs do |t|
      t.string :content
      t.integer :user_id
      t.string :tag

      t.timestamps
    end
  end
end
