class AddUniqueConstraintToActorMovie < ActiveRecord::Migration[7.0]
  def change
    add_index :actor_movies, [:movie_id, :actor_id], unique: true
  end
end
