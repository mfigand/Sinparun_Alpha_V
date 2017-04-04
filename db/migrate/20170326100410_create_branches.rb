class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :schedule
      t.string :city
      t.string :state
      t.string :country
      t.string :url
      t.string :latitude
      t.string :longitude

      t.references :company, index: true
      t.references :reward, index: true
      t.references :employee, index: true
    end
  end
end
