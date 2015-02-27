class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|

      t.timestamps
    end
  end
end
