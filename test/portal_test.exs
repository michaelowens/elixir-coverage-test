defmodule PortalTest do
  use ExUnit.Case

  setup do
    Portal.shoot(:orange)
    Portal.shoot(:blue)
    :ok
  end

  test "Portal exist" do
    portal = Portal.transfer(:orange, :blue, [1,2,3,4])
    Portal.push_right(portal)
    assert Portal.Door.get(:orange) == [3,2,1]
    assert Portal.Door.get(:blue) == [4]
    assert 1 + 1 == 2
  end

  # test "Portal exist again", context do
  #   assert 1 + 3 == 2
  # end
end
