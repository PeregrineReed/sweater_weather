class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :place_id
      t.string :name
      t.string :state
      t.string :country
      t.float :latitude
      t.float :longitude
    end
  end
end
