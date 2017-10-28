defmodule BumpTracker.Bumps do
  @moduledoc """
  The Bumps context.
  """

  import Ecto.Query, warn: false
  alias BumpTracker.Repo

  alias BumpTracker.Bumps.Bump

  @doc """
  Returns the list of bumps.

  ## Examples

      iex> list_bumps()
      [%Bump{}, ...]

  """
  def list_bumps do
    Repo.all(Bump)
  end

  @doc """
  Gets a single bump.

  Raises `Ecto.NoResultsError` if the Bump does not exist.

  ## Examples

      iex> get_bump!(123)
      %Bump{}

      iex> get_bump!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bump!(id), do: Repo.get!(Bump, id)

  @doc """
  Creates a bump.

  ## Examples

      iex> create_bump(%{field: value})
      {:ok, %Bump{}}

      iex> create_bump(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bump(attrs \\ %{}) do
    %Bump{}
    |> Bump.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bump.

  ## Examples

      iex> update_bump(bump, %{field: new_value})
      {:ok, %Bump{}}

      iex> update_bump(bump, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bump(%Bump{} = bump, attrs) do
    bump
    |> Bump.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Bump.

  ## Examples

      iex> delete_bump(bump)
      {:ok, %Bump{}}

      iex> delete_bump(bump)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bump(%Bump{} = bump) do
    Repo.delete(bump)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bump changes.

  ## Examples

      iex> change_bump(bump)
      %Ecto.Changeset{source: %Bump{}}

  """
  def change_bump(%Bump{} = bump) do
    Bump.changeset(bump, %{})
  end
end
