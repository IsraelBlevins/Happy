class AddDatesToDisplayedQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :displayed_questions, :question_start, :datetime
    add_column :displayed_questions, :question_end, :datetime
  end
end
