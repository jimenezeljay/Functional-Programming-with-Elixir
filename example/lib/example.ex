defmodule Example do
  use Application

  def start(_type, _args) do #_args describes data past to the parameter
    #code
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one ) #it supervises other processes (child processes) and restarts them if they fail. The empty list [] indicates that there are no child processes to supervise, and the strategy :one_for_one means that if a child process crashes, only that process will be restarted
  end

  def main do
    name = "Eljay";
    status = Enum.random([:gold, :silver, :bronze])

    if status === :gold do
      IO.puts("Welcome, #{name}! Welcome to fancy lounge.")
    else
      IO.puts("Get lost")
    end
  end
end

#creating variables
