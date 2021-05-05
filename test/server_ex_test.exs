defmodule ServerExTest do
  use ExUnit.Case
  doctest ServerEx

  test "greets the world" do
    assert ServerEx.hello() == :world
  end
end
