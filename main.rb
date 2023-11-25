require "discordrb"

bot = Discordrb::Commands::CommandBot.new token: ENV["TOKEN"], prefix: "$"

puts "Bot is Online"

bot.command :cmd do |event, *code|
    begin
        command = "firejail --private=GULAG --nogroups --noroot --noprofile #{code.join(" ")} 2>&1"  # Redirige la salida estándar y estándar de error al mismo lugar
        output = IO.popen(command) { |io| io.read }

        relevant_output = output[/Child process initialized in .* ms(.*?)\nParent is shutting down, bye.../m, 1]

        response = relevant_output&.strip
        if response == '' then
            response = "<empty>"
        end

        event.respond "Output: ```bash\n#{response}```"
    rescue => e
        event.respond "Error: #{e.message}"
    end
end

bot.run