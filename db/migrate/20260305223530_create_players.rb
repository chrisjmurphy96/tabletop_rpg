class CreatePlayers < ActiveRecord::Migration[8.1]
  def change
    create_table :players do |t|
      # t.string :id
      t.string :style_left
      t.string :style_top
      t.string :color
      t.string :name

      t.timestamps
    end
  end
end
