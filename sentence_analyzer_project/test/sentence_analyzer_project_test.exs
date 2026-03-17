defmodule SentenceAnalyzerProjectTest do
  use ExUnit.Case
  doctest SentenceAnalyzerProject

  test "greets the world" do
    assert SentenceAnalyzerProject.hello() == :world
  end
end
