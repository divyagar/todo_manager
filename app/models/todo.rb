class Todo < ActiveRecord::Base
  def to_displayable_string
    isCompleted = completed ? "[X]" : "[ ]"
    "#{id} #{due_date.to_s(:long)} #{todo_text} #{isCompleted}"
  end
  
  def self.overdue
    all.where("due_date < ? and completed = ?", Date.today, false)
  end

  def self.due_today
    all.where(due_date: Date.today)
  end
  
  def self.due_later
    all.where("due_date > ?", Date.today)
  end

  def self.isCompleted
    all.where(completed: true)
  end


end