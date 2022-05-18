class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :onsen, foreign_key: true
      t.string :impression
      t.integer:score
      
      t.timestamps
    end
  end
end 
