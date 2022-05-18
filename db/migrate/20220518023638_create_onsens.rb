class CreateOnsens < ActiveRecord::Migration[6.1]
  def change
    create_table :onsens do |t|
      t.string :name 
      
      t.timestamps
    end
  end
end
