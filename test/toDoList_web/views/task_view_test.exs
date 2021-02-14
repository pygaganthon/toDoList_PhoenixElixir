defmodule ToDoListWeb.TaskViewTest do
    use ToDoListWeb.ConnCase, async: true
    alias ToDoListWeb.TaskView
  
    test "complete/1 returns completed if task.status == 1" do
      assert TaskView.complete(%{status: 1}) == "completed"
    end
  
    test "complete/1 returns empty string if task.status == 0" do
      assert TaskView.complete(%{status: 0}) == ""
    end
  
    test "checked/1 returns checked if task.status == 1" do
      assert TaskView.checked(%{status: 1}) == "checked"
    end
  
    test "checked/1 returns empty string if task.status == 0" do
      assert TaskView.checked(%{status: 0}) == ""
    end
end