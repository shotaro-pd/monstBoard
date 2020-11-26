class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :title
      t.string :name
      t.string :main
      t.string :url

      t.timestamps
    end
  end
end
