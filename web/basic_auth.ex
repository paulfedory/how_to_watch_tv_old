defmodule BasicAuth do
  import Plug.Conn

  @realm "Basic realm=\"How To Watch TV Admin\""

  def init(opts), do: opts

  def call(conn, correct_auth_details) do
    case get_req_header(conn, "authorization") do
      ["Basic " <> auth] -> verify(conn, auth, correct_auth_details)
      _                  -> unauthorized(conn)
    end
  end

  defp verify(conn, attempted_auth, [username: username, password: password]) do
    case encode(username, password) do
      ^attempted_auth -> conn
      _               -> unauthorized(conn)
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

