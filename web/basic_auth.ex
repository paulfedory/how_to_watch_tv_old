defmodule BasicAuth do
  import Plug.Conn
  require Logger

  @realm "Basic realm=\"How To Watch TV Admin\""

  def init(_) do
    Application.fetch_env!(:how_to_watch_tv, BasicAuth)
  end

  def call(conn, [username: username, password: password]) do
    Logger.info "username: #{username}"
    Logger.info System.get_env("AUTH_USERNAME")
    Logger.info "password: #{password}"
    Logger.info System.get_env("AUTH_PASSWORD")
    Logger.info encode(username, password)
    case get_req_header(conn, "authorization") do
      ["Basic " <> auth] ->
        if auth == encode(username, password) do
          conn
        else
          unauthorized(conn)
        end
      _ ->
        unauthorized(conn)
    end
  end

  defp encode(username, password), do: Base.encode64(username <> ":" <> password)

  defp unauthorized(conn) do
    conn
    |> put_resp_header("www-authenticate", @realm)
    |> send_resp(401, "unauthorized")
    |> halt()
  end
end

