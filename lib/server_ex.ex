defmodule ServerEx do
  def handle_post do
    message = %{text: "Hello from the POST handler"}
    {:ok, message}
  end

  def handle_get do
    message = %{text: "Hello from the GET handler"}
    {:ok, message}
  end
end
