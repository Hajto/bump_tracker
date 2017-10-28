defmodule BumpTrackerWeb.BumpView do
  use BumpTrackerWeb, :view
  alias BumpTrackerWeb.BumpView

  def render("index.json", %{bumps: bumps}) do
    %{data: render_many(bumps, BumpView, "bump.json")}
  end

  def render("show.json", %{bump: bump}) do
    %{data: render_one(bump, BumpView, "bump.json")}
  end

  def render("bump.json", %{bump: bump}) do
    %{id: bump.id,
      date: bump.date,
      position: render_one(bump.position, BumpView, "position.json")
    }
  end

  def render("position.json", %{bump: position}) do
    %{lat: position.lat, lng: position.lng}
  end
end
