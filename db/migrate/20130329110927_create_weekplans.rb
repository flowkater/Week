class CreateWeekplans < ActiveRecord::Migration
  def change
    create_table :weekplans do |t|

    	t.references :user

      t.timestamps
    end
  end
end
