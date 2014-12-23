class CreateUserTraditionalRoutes < ActiveRecord::Migration
  def change
    create_table :user_traditional_routes do |t|
      t.references :user, index: true
      t.references :traditional_route, index: true
      t.integer :complete

      t.timestamps
    end
  end
end
