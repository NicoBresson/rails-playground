class AddDetailsToSchools < ActiveRecord::Migration[5.0]
  def change
    add_column :schools, :zipcode, :integer
    add_column :schools, :city, :string
    add_column :schools, :country, :string
  end
end
