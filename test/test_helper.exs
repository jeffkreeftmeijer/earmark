case Mix.env do 
  :acceptance_test -> ExUnit.configure(include: [:acceptance_test], exclude: [:test])
  _                -> ExUnit.configure(exclude: [:wip, :later, :acceptance_test])
end

ExUnit.start()
