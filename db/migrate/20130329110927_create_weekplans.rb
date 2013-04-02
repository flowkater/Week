class CreateWeekplans < ActiveRecord::Migration
  def change
    create_table :weekplans do |t|

    	# 3-29.md
    	t.references :user

  		# 3-30.md - add columns
    	t.integer :progress_rate, default: 0
    	t.boolean :public_friends
    	t.boolean :public_all

      t.timestamps
    end
  end
end
