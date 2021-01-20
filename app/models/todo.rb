class Todo < ActiveRecord::Base
  def to_displayable_string
    isCompleted = completed ? "[X]" : "[ ]"
    "#{isCompleted} #{due_date.to_s(:long)} #{todo_text} #{completed}"
  end
end