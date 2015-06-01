
module PackRackCLI

	class Images < Base

		desc "list", "list images and Ids from rackspace"
		def list
			rack_connect
			@client.images.all.each do |image|
				puts "#{image.id}\t#{image.name}"
			end
		end


	end

end
