class CreateFaces < ActiveRecord::Migration[6.0]
  def change
    create_table :faces do |t|

			t.text       :text,          null: false
			t.text       :skill,         null: false
			t.text       :hobby,         null: false
			t.integer    :department_id, null: false
			t.integer    :gender_id,     null: false
			t.integer    :birthplace_id, null: false
			t.integer    :history_id,    null: false
			t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
