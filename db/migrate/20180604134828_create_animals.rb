class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :photo
      t.string :animal
      t.string :tweet
      t.string :days

      t.timestamps
    end
  end
end
