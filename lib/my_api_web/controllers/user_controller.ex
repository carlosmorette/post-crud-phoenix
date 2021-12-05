defmodule MyApiWeb.UserController do
  use MyApiWeb, :controller

  def show(conn, _params) do
    conn
    |> put_status(:ok)
    |> render("index.json", users: MyApi.User.get_all())
  end

  def create(conn, _params) do
    case MyApi.User.insert(conn.body_params) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render("user.json", user: user)

      {:error, _changeset} ->
        conn
        |> put_status(:bad_request)
        |> json(%{message: "invalid_data"})
    end
  end

  def update(conn, %{"id" => id}) do
    case MyApi.User.update(String.to_integer(id), conn.body_params) do
      {:ok, _user} ->
        resp(conn, :ok, "")

      {:error, :not_found} ->
        resp(conn, :not_found, "")
    end
  end

  def delete(conn, %{"id" => id}) do
    case MyApi.User.delete(id) do
      {:ok, _user} ->
        resp(conn, :ok, "")

      {:error, :not_found} ->
        resp(conn, :not_found, "")
    end
  end
end
