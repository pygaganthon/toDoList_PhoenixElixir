defmodule ToDoList.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :input, :string
      add :user_id, :integer
      add :status, :integer

      timestamps()
    end

  end
end
