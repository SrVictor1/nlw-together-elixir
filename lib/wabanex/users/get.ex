defmodule Wabanex.Users.Get do
  alias Wabanex.{Repo, User}

    def call(id) do
      id
      |> Ecto.UUID.cast()
      |> handler_response()
    end

    defp handler_response(:error) do
      {:error, "Invalid UUID"}
    end

    defp handler_response({:ok, uuid}) do
      case Repo.get(User, uuid) do
        nil -> {:error, "User not found"}
        user -> {:ok, user}
      end
    end
  end