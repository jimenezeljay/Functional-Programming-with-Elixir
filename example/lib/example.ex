defmodule Example do
  use Application
  alias UUID #how you export external libraries to your code, you can use the alias keyword to create an alias for the module. In this case, it allows you to refer to the UUID module without having to prefix it with its full name.

  def start(_type, _args) do #_args describes data past to the parameter
    #code
    IO.puts(UUID.uuid4()) # generates a random UUID (Universally Unique Identifier) using the uuid4 function from the UUID module. This is often used to create unique identifiers for various purposes, such as database records or session tokens.
    Supervisor.start_link([], strategy: :one_for_one ) #it supervises other processes (child processes) and restarts them if they fail. The empty list [] indicates that there are no child processes to supervise, and the strategy :one_for_one means that if a child process crashes, only that process will be restarted
  end

  def hello do
    :world
  end
end
