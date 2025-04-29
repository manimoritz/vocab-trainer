class AddVerbToForm < ActiveRecord::Migration[8.0]
  def change
    add_reference :forms, :verb, null: false, foreign_key: true
  end
end
