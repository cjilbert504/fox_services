module TasksHelper
    def check_task_complete 
        @task.completed ? "Completed" : "Incomplete"
    end

    def check_if_task_assigned
        if @task.employee != nil
            @task.employee.name
        else
            "Task Is Not Assigned!"
        end
    end

end
