defmodule ToDoList.Todo.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :input, :string
    field :status, :integer, default: 0
    field :user_id, :integer, default: 0

    timestamps()
  end 

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:input, :user_id, :status])
    |> validate_required([:input]) # we are removing the requirement for user_id and status. That way our new task form can be submitted with just the input field.
  end
end
