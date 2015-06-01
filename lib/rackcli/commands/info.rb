
module PackRackCLI

	class Info < Base

		desc "about", "Info about connection"
		def about
			rack_connect
			ap @client
			ap @client.images.all
			ap @client.flavors.all
		end

	end

end
