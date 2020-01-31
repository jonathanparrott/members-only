class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :new
      t.string :create
      t.string :index

      t.timestamps
    end
  end
end
