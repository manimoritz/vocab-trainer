class CreateForms < ActiveRecord::Migration[8.0]
  def change
    create_table :forms do |t|
      t.string :text, null: false

      t.string :person, null: false
      t.string :number, null: false
      t.string :tense, null: false
      t.string :voice, null: false
      t.string :mood, null: false

      t.timestamps
    end
  end
end
