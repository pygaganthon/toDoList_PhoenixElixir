defmodule ToDoListWeb.TaskView do
  use ToDoListWeb, :view

  # add class "completed" to a list task if task.status=1 
  def complete(task) do
    case task.status do
      1 -> "completed"
      _ -> "" # empty string means empty class so no style applied
    end
  end

  # add "checked" to input if task.status=1
  def checked(task) do
    case task.status do
      1 -> "checked"
      _ -> "" # empty string means empty class so no style applied
    end
  end

end

