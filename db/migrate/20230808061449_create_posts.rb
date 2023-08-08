class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title,            null: false
      t.string :disease,          null: false
      t.string :name,             null: false
      t.integer :age,             null: false
      t.integer :sex,             null: false
      t.string :family,           null: false
      t.string :airway,           null: false
      t.string :breathing,        null: false
      t.string :circulation,      null: false
      t.string :dysfunction_cns,  null: false
      t.string :exposure
      t.string :symptom,          null: false
      t.string :allergy,          null: false
      t.string :medicine,         null: false
      t.string :past_history,     null: false
      t.string :last_meal,        null: false
      t.string :event,            null: false
      t.string :risk_factor,      null: false
      t.string :others
      t.text :story,              null: false
      t.text :point,              null: false
      t.references :user,         null: false, foreign_key: true

      t.timestamps
    end
  end
end
