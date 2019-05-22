class CreateWorkExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :work_experiences do |t|
      t.text :description
      t.date :start_time
      t.date :end_time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
