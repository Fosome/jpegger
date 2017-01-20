defmodule Jpegger.Convert do

  def convert(path) do
    IO.puts("Converting #{path}")

    System.cmd("convert", ["-gamma", "1.6", path, "out/jpegger_#{Path.basename(path)}.jpg"])

    IO.puts("Finished #{path}")
  end
end
