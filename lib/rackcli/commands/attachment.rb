
module PackRackCLI

	class Attachment < Base

		desc "inspect", "What are there inside Object"
		def inspect
			rack_connect
			@client.attachments.inspect
		end

	end

end
