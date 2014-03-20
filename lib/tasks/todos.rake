namespace :todos do
  desc "TODO"
  task daily_todos: :environment do
  	todos = Todo.where "created_at between ? AND ?", Time.zone.now.beginning_of_day, Time.zone.now.end_of_day
  	Reminder.items_posted(todos).deliver unless todos.empty?
  end

end
