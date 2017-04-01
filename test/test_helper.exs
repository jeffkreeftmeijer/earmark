# :erlang.system_flag( :schedulers_online, 1)

# ExUnit.start( timeout: 3000)

case Mix.env do 
  :test            -> ExUnit.configure(exclude: [:wip, :later, :acceptance])
  :acceptance_test -> ExUnit.configure(include: [:acceptance], exclude: [:test])
  env              -> IO.puts(:stderr, "Cannot run tests in env #{inspect env}, please use one of: #{inspect [:test, :acceptance_test]}")
                      exit(2)
end
ExUnit.start()


