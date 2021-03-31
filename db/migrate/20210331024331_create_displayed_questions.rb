class CreateDisplayedQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :displayed_questions do |t|
      t.string "question"
      t.string "question_type"
      t.timestamps
    end
  end
end
