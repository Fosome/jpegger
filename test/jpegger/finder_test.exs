defmodule Jpegger.FinderTest do
  use ExUnit.Case

  import Jpegger.Finder

  describe "find" do
    test "returns a tuple with :ok and the list of file paths" do
      assert find("../fixtures/finder") == { :ok, [] }
    end
  end
end
