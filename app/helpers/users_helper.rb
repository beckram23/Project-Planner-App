module UsersHelper

def openProjects
@projectslist = Project.find( :all, :conditions => ['Status = "Open"'])
return @projectslist
end

def suspProjects
@projectslist = Project.find( :all, :conditions => ['Status = "Suspended"'])
return @projectslist
end

def closedProjects
@projectslist = Project.find( :all, :conditions => ['Status = "Closed"'])
return @projectslist
end

def tasksframe pid
@taskslist = Task.find(:all, :conditions => ['ProjectID = ?',"#{pid}"])
return @taskslist
end

def getProjectName pid
@project = Project.find(:first, :conditions => ['ProjectID = ?', "#{pid}"])
"#{@project.Title}"
end

def getTaskUsers(task,pid)
@users = Task.find(:all, :conditions => ['Tasks = ? and ProjectID = ?', "#{task}", "#{pid}"])
users = ""
@users.each do |u|
	users += u.UserName
	users += ", "
end
users = users[0...-2]
"#{users}"
end

def getCurrentUser
@users = User.find(:all)
@users.each do |u|
	if session[:UserName] == session[u.UserName]
		return u.UserName
	end
end
end

def getUserTasks(user,pid)
@tasks = Task.find(:all, :conditions => ['ProjectID = ? and UserName = ?', "#{pid}", "#{user}"])
tasks = ""
@tasks.each_with_index do |t,i|
	tasks += "<p>#{i+1}. ".html_safe
	tasks += t.Tasks
	tasks += ". <b>Status: </b>".html_safe
	tasks += t.Status
	tasks += "</p>".html_safe
end
"#{tasks}"
end

def getDeadline(task,pid)
@date = Task.find(:first, :conditions => ['Tasks = ? and ProjectID = ?', "#{task}", "#{pid}"])
difference = (@date.Deadline - Date.today).to_i
"#{difference}"
end

end
