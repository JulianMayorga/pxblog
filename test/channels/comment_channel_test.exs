defmodule Pxblog.CommentChannelTest do
  use Pxblog.ChannelCase

  alias Pxblog.CommentChannel

  setup do
    {:ok, _, socket} =
      socket("user_id", %{some: :assign})
      |> subscribe_and_join(CommentChannel, "comments:lobby")

    {:ok, socket: socket}
  end

  test "broadcasts are pushed to the client", %{socket: socket} do
    broadcast_from! socket, "broadcast", %{"some" => "data"}
    assert_push "broadcast", %{"some" => "data"}
  end
end
