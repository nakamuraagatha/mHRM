class TaskNote < Note
  belongs_to :root, foreign_key: :owner_id, class_name: 'Task'

  def object
    root
  end

end
