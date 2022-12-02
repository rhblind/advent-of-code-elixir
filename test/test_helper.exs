ExUnit.start()

defmodule TestHelper do
  defmodule Fixture do
    def read(filename) do
      File.read!("test/support/fixtures/#{filename}")
    end
  end
end
