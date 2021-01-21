class Todo < ActiveRecord::Base
  def to_displayable_string
    isCompleted = completed ? "[X]" : "[ ]"
    "#{id} #{due_date.to_s(:long)} #{todo_text} #{isCompleted}"
  end
end