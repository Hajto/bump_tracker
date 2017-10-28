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
      date: bump.date}
  end
end
