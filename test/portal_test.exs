defmodule PortalTest do
  use ExUnit.Case

  """
  #Portal<
         :orange <=> :blue
    [1, 2, 3, 4] <=> []
  >
  """
  test "Custom Portal inspector" do
    Portal.Door.start_link(:red)
    Portal.Door.start_link(:green)
    portal = Portal.transfer(:red, :green, [1,2,3,4])
    assert Regex.match?(~r/^#Portal<\n(.+?) <=> (.+?)\n(.+?) <=> (.+?)\n>$/m, inspect(portal))
  end

  test "Can push data between portals" do
    Portal.shoot(:orange)
    Portal.shoot(:blue)
    portal = Portal.transfer(:orange, :blue, [1,2,3,4])
    Portal.push_right(portal)
    assert Portal.Door.get(:orange) == [3,2,1]
    assert Portal.Door.get(:blue) == [4]
  end
end
