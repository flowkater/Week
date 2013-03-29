class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
    	t.string :title

    	t.references :weekplan

      t.timestamps
    end
  end
end
