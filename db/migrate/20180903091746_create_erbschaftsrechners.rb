class CreateErbschaftsrechners < ActiveRecord::Migration[5.2]
  def change
    create_table :erbschaftsrechners do |t|
      t.string :verwandschaftsverhältniss
      t.integer :vermögen
      t.integer :steuerklasse
      t.integer :steuersatz
      t.integer :freibetrag

      t.timestamps
    end
  end
end
