class Reminder < ActionMailer::Base
  default from: "ind.standupboard@gmail.com", to: "makati-devs@indinero.com"

  def items_posted(todos)
  	@todos = todos 
  	mail(subject:"Ticket filed today")
  end

end
