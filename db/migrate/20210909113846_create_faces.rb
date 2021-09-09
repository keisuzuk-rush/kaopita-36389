class CreateFaces < ActiveRecord::Migration[6.0]
  def change
    create_table :faces do |t|

			t.string :text,       null: false
			t.string :department, null: false
			t.string :skill,      null: false
			t.references :user,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
