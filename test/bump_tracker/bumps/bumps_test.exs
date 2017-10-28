defmodule BumpTracker.BumpsTest do
  use BumpTracker.DataCase

  alias BumpTracker.Bumps

  describe "bumps" do
    alias BumpTracker.Bumps.Bump

    @valid_attrs %{date: ~N[2010-04-17 14:00:00.000000], position: %{x: 1.2, y: 1.4}}
    @update_attrs %{date: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{date: nil}

    def bump_fixture(attrs \\ %{}) do
      {:ok, bump} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bumps.create_bump()

      bump
    end

    test "list_bumps/0 returns all bumps" do
      bump = bump_fixture()
      assert Bumps.list_bumps() == [bump]
    end

    test "get_bump!/1 returns the bump with given id" do
      bump = bump_fixture()
      assert Bumps.get_bump!(bump.id) == bump
    end

    test "create_bump/1 with valid data creates a bump" do
      assert {:ok, %Bump{} = bump} = Bumps.create_bump(@valid_attrs)
      assert bump.date == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_bump/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bumps.create_bump(@invalid_attrs)
    end

    test "update_bump/2 with valid data updates the bump" do
      bump = bump_fixture()
      assert {:ok, bump} = Bumps.update_bump(bump, @update_attrs)
      assert %Bump{} = bump
      assert bump.date == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_bump/2 with invalid data returns error changeset" do
      bump = bump_fixture()
      assert {:error, %Ecto.Changeset{}} = Bumps.update_bump(bump, @invalid_attrs)
      assert bump == Bumps.get_bump!(bump.id)
    end

    test "delete_bump/1 deletes the bump" do
      bump = bump_fixture()
      assert {:ok, %Bump{}} = Bumps.delete_bump(bump)
      assert_raise Ecto.NoResultsError, fn -> Bumps.get_bump!(bump.id) end
    end

    test "change_bump/1 returns a bump changeset" do
      bump = bump_fixture()
      assert %Ecto.Changeset{} = Bumps.change_bump(bump)
    end
  end
end
