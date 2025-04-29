class AddPrinciplePartsToVerb < ActiveRecord::Migration[8.0]
  def change
    add_column :verbs, :present_active, :string
    rename_column :verbs, :infinitive, :present_infinitive
    add_column :verbs, :perfect_active, :string
    add_column :verbs, :supine, :string
  end
end
