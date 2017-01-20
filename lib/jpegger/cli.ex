defmodule Jpegger.CLI do

  def main(argv) do
    process_args(argv)
      |> Jpegger.Finder.find()
      |> pmap(&(Jpegger.Convert.convert(&1)))
  end

  defp process_args(args) do
    OptionParser.parse(args)
      |> select_path
  end

  defp select_path({ [], [path], [] }), do: path

  defp select_path({ _, _, _ }), do: System.halt(1)

  defp pmap(list, func) do
    list
      |> Enum.map(&(Task.async(fn -> func.(&1) end)))
      |> Enum.map(&(Task.await(&1, 90000))) # Wait 90 secs per process
  end
end
