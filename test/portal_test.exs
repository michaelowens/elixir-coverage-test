defmodule PortalTest do
  use ExUnit.Case

  @cmd_result "test_result"

  @stats_result "" <>
    " test"

  test "Portal exist" do
    assert 1 + 1 == 2
  end

  test "Portal exist again" do
    assert 1 + 3 == 2
  end
end
