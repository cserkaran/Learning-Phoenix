defmodule RsvpWeb.EventController do
    use RsvpWeb.Web, :controller 

    def show(conn, %{"id" => id}) do
        event = Rsvp.EventQueries.get_by_id(id)
        render conn, "details.html", event: event
    end

    def list(conn, _params) do 
        events = Rsvp.EventQueries.get_all
        render conn, "list.html", events: events
    end

    def create(conn, %{errors: errors}) do 
        changeset = Rsvp.Events.changeset(%Rsvp.Events{}, %{})
        render conn, "create.html", changeset: errors
    end

    def create(conn, _params) do 
        changeset = Rsvp.Events.changeset(%Rsvp.Events{}, %{})
        render conn, "create.html", changeset: changeset
    end

    def add(conn, %{"events" => events}) do
    #    "2017-03-01T08:00" 
        events = Map.update!(events, "date", fn d -> "2018-07-23 09:00:00" end)

        changeset = Rsvp.Events.changeset(%Rsvp.Events{}, events)

        case Rsvp.EventQueries.create changeset do
            {:ok, %{id: id}} -> redirect conn, to: event_path(conn, :show, id)
            {:error, reasons} -> create conn, %{errors: reasons}
        end 
    end     

end