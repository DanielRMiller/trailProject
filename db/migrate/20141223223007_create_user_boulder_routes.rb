class CreateUserBoulderRoutes < ActiveRecord::Migration
  def change
    create_table :user_boulder_routes do |t|
      t.references :user, index: true
      t.references :boulder_route, index: true
      t.integer :complete

      t.timestamps
    end
  end
end
