
module PackRackCLI

	class Flavor < Base

		desc "list", "list flavors and Ids from rackspace"
		def list
			get_flavours
			ap @flavors
		end

		no_commands do

			def get_flavours
				rack_connect
				@flavors = []
				@client.flavors.all.each do |flavor|
					@flavors << { :id => flavor.id, 
											:name => flavor.name, 
											:ram => flavor.ram,
											:disk => flavor.disk,
											:vcpus => flavor.vcpus }
				end
			end

		end

	end

end
