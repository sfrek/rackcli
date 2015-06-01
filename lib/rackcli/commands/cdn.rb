
module PackRackCLI

	class CDN < Base

		desc "inspect", "What are there inside Object"
		def inspect
			rack_storage_connect
			@clientStorage.inspect
		end

	end

end
