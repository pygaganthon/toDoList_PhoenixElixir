defmodule ToDoListWeb.TaskController do
  use ToDoListWeb, :controller

  alias ToDoList.Todo
  alias ToDoList.Todo.Task

  def index(conn, params) do
    task = if not is_nil(params) and Map.has_key?(params, "id") do
      Todo.get_task!(params["id"])
    else
      %Task{}
    end
    tasks = Todo.list_tasks()
    changeset = Todo.change_task(task)  
    render(conn, "index.html", tasks: tasks, changeset: changeset, editing: task)
  end

  def new(conn, _params) do
    changeset = Todo.change_task(%Task{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"task" => task_params}) do
    case Todo.create_task(task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: Routes.task_path(conn, :index)) #

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Todo.get_task!(id)
    render(conn, "show.html", task: task)
  end

  def edit(conn, params) do
    index(conn, params) 
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Todo.get_task!(id)

    case Todo.update_task(task, task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task updated successfully.")
        |> redirect(to: Routes.task_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", task: task, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Todo.get_task!(id)
    {:ok, _task} = Todo.delete_task(task)

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: Routes.task_path(conn, :index)) 
  end

  def toggle_status(task) do
    case task.status do
      1 -> 0
      0 -> 1
    end
  end

  def toggle(conn, %{"id" => id}) do
    task = Todo.get_task!(id)
    Todo.update_task(task, %{status: toggle_status(task)})
    redirect(conn, to: Routes.task_path(conn, :index))
  end
end
