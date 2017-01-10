defmodule HackneySslTest do
  def main(_argv) do
    Application.ensure_all_started(:hackney)
    IO.puts("#{inspect :hackney.get("https://s3-us-west-2.amazonaws.com")}")
  end
end
