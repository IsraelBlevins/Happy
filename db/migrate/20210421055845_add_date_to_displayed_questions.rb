class AddDateToDisplayedQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :displayed_questions, :question_date, :datetime
  end
end
