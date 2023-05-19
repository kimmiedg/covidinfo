class CreateCovidObservations < ActiveRecord::Migration[6.1]
  def change
    create_table :covid_observations do |t|
      t.date :observation_date
      t.string :country
      t.integer :confirmed
      t.integer :deaths
      t.string :province
      t.integer :recovered

      t.timestamps null: false
    end
  end
end
