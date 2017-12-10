defmodule Rsvp do
  use Application

  def start(_type,_args) do 
    import Supervisor.Spec, warn: false

    children = [
      worker(Rsvp.Repo,[])
    ]

    opts = [strategy: :one_for_one, name: Rsvp.Supervisor]
    Supervisor.start_link(children,opts)

 end
end
