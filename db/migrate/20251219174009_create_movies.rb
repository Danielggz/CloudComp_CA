class CreateMovies < ActiveRecord::Migration[8.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :director
      t.string :duration

      t.timestamps
    end
  end
end
