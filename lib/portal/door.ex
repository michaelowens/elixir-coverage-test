defmodule Portal.Door do
  alias Portal.Door

  @doc """
  Starts a door with a given `color`.

  The color is given as a name so we can identify
  the door by color name instead of using a PID
  """
  def start_link(color) do
    Agent.start_link(fn -> [] end, name: color)
  end

  @doc """
  Get the data currently in the `door`.
  """
  def get(door) do
    Agent.get(door, &(&1))
  end

  @doc """
  Pushes `value` into door.
  """
  def push(door, value) do
    Agent.update(door, &([value|&1]))
  end

  @doc """
  Pops a value from the `door`.

  Returns `{:ok, value}` if there is a value
  or `:error` if the hole is currently empty.
  """
  def pop(door) do
    Agent.get_and_update(door, fn
      []    -> {:error, []}
      [h|t] -> {{:ok, h}, t}
    end)
  end
end