defmodule BumpTrackerWeb.BumpController do
  use BumpTrackerWeb, :controller

  alias BumpTracker.Bumps
  alias BumpTracker.Bumps.Bump

  action_fallback BumpTrackerWeb.FallbackController

  def index(conn, _params) do
    bumps = Bumps.list_bumps()
    render(conn, "index.json", bumps: bumps)
  end

  def create(conn, %{"bump" => bump_params}) do
    with {:ok, %Bump{} = bump} <- Bumps.create_bump(bump_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", bump_path(conn, :show, bump))
      |> render("show.json", bump: bump)
    end
  end

  def show(conn, %{"id" => id}) do
    bump = Bumps.get_bump!(id)
    render(conn, "show.json", bump: bump)
  end

  def update(conn, %{"id" => id, "bump" => bump_params}) do
    bump = Bumps.get_bump!(id)

    with {:ok, %Bump{} = bump} <- Bumps.update_bump(bump, bump_params) do
      render(conn, "show.json", bump: bump)
    end
  end

  def delete(conn, %{"id" => id}) do
    bump = Bumps.get_bump!(id)
    with {:ok, %Bump{}} <- Bumps.delete_bump(bump) do
      send_resp(conn, :no_content, "")
    end
  end
end
