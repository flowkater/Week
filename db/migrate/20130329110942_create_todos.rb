class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
    	# 3-29.md
    	t.string :title

    	t.references :weekplan

    	# 3-30.md - add columns
    	t.string :title
      t.string :description
    	t.string :category
    	t.boolean :todo_check

      t.timestamps
    end
  end
end
