class Cli
    attr_accessor :user, :project, :task

    def prompt
        TTY::Prompt.new
    end
    #we do this so we can save the sessions user name. Anything else you want to 
    #refer to in the sesssion, make it an attribute here.
    def initialize user=nil, project=nil, task=nil
        @user = user
        @project = project
        @task = task

        #everywhere you stored a local variabel for the above you can just call it on self
    end

    def main_menu
        puts "Welcome to Collaboratron!"
        set_user
        welcome_user
        show_project
        
    end

    def show_tasks

    end
    def show_project
        prompt.select("Do you want to see your current projects?", ["Yah", "nah"])
        if (response == "Yah")
            response = prompt.select "Please choose a project...", user.project_boards.pluck(:name).uniq
            project = ProjectBoard.find_by(name: response)
            show_tasks(project)
        else
            show_project
        end
    end

    def show_tasks(project)
        project_user_tasks = user.user_tasks.select do |user_task| 
            user_task.project_board_id == project.id
        end

        project_tasks = project_user_tasks.map(&:task)
        #& here is a proc. It calls the task method on every enumeration. accesses the task

        prompt.select("Choose a task to see more details...", project_tasks.pluck(:title))
        task = Task.find_by(title: response)
        show_task_content(task)
    end

    def show_task_content(task)
        puts "\n\n"
    end
    def welcome_user
        "Welcome #{user.username}"
    end

    def set_user
        puts "Sign up / Sign In -- Enter username" 
        username = gets.chomp
        self.user = User.find_or_create_by(username: username)
    end
end