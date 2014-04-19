defmodule NervesStarterKit do
  use Application.Behaviour

	@moduledoc """
  This module demonstrates a small Elixir application that turns on and off
  one of the GPIOs on the Raspberry Pi. Hook the GPIO up to a LED to see it
  blink.
  """

  def start(_type, _args) do
    IO.puts "Starting..."

		# Start the supervisor to launch our
		# Worker process.
		NervesStarterKit.Supervisor.start_link
  end

	defmodule Worker do
		use GenServer.Behaviour

		def start_link do
			:gen_server.start_link(__MODULE__, __MODULE__, [])
		end

		def init(_) do
			IO.puts "#{__MODULE__} started"

			Gpio.start_link 22, :output

			:timer.send_interval(500, :toggle)

			{:ok, 0}
		end

		def handle_info(:toggle, 0) do
			Gpio.write 22, 1
			{:noreply, 1}
		end
		def handle_info(:toggle, 1) do
			Gpio.write 22, 0
			{:noreply, 0}
		end

	end

end
