module TasksHelper
  def get_back_url task
    if task.related_to_id
      return case_path(task.related_to_id) if task.related_to_type == 'case'
    end
    tasks_path
  end
end
