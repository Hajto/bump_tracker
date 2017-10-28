defmodule BumpTrackerWeb.BumpControllerTest do
  use BumpTrackerWeb.ConnCase

  alias BumpTracker.Bumps
  alias BumpTracker.Bumps.Bump

  @create_attrs %{date: ~N[2010-04-17 14:00:00.000000]}
  @update_attrs %{date: ~N[2011-05-18 15:01:01.000000]}
  @invalid_attrs %{date: nil}

  def fixture(:bump) do
    {:ok, bump} = Bumps.create_bump(@create_attrs)
    bump
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all bumps", %{conn: conn} do
      conn = get conn, bump_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create bump" do
    test "renders bump when data is valid", %{conn: conn} do
      conn = post conn, bump_path(conn, :create), bump: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, bump_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "date" => "2010-04-17T14:00:00.000000"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, bump_path(conn, :create), bump: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update bump" do
    setup [:create_bump]

    test "renders bump when data is valid", %{conn: conn, bump: %Bump{id: id} = bump} do
      conn = put conn, bump_path(conn, :update, bump), bump: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, bump_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "date" => "2011-05-18T15:01:01.000000"}
    end

    test "renders errors when data is invalid", %{conn: conn, bump: bump} do
      conn = put conn, bump_path(conn, :update, bump), bump: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete bump" do
    setup [:create_bump]

    test "deletes chosen bump", %{conn: conn, bump: bump} do
      conn = delete conn, bump_path(conn, :delete, bump)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, bump_path(conn, :show, bump)
      end
    end
  end

  defp create_bump(_) do
    bump = fixture(:bump)
    {:ok, bump: bump}
  end
end
