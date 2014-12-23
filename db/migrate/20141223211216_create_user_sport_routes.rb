class CreateUserSportRoutes < ActiveRecord::Migration
  def change
    create_table :user_sport_routes do |t|
      t.references :user, index: true
      t.references :sport_route, index: true
      t.integer :complete

      t.timestamps
    end
  end
end
