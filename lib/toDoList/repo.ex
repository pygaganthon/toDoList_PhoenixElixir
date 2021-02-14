defmodule ToDoList.Repo do
  use Ecto.Repo,
    otp_app: :toDoList,
    adapter: Ecto.Adapters.Postgres
end
