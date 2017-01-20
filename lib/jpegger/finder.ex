defmodule Jpegger.Finder do

  def find(path) do
    path
      |> list_files
      |> build_full_paths(path)
  end

  defp list_files(path) do
    File.ls(path)
  end

  defp build_full_paths({ :ok, paths }, root) do
    paths
      |> Enum.map(&(Path.join(root, &1)))
      |> Enum.map(&Path.expand/1)
  end

  defp build_full_paths({ :error, error }, _) do
    IO.puts "Error finding files: #{error}"
    System.halt(1)
  end
end
