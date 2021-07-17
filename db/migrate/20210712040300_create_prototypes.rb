class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string     :prototype_title
      t.text       :prototype_catch_copy
      t.text       :prototype_concept
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
