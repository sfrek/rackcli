module PackRackCLI

	class Network < Base

		desc "attach fqdn network1 ... networkN", "attach networks to a server"
		def attach(fqdn,*networks)
			puts fqdn
			puts networks

			puts get_servers(fqdn)
		end
	
		desc "list", "list networks"
		option :json
		def list
			nets = get_networks
			if options[:json]
				puts JSON.pretty_generate( JSON.parse( nets.to_json ) )
			else
				puts nets.to_yaml
			end
		end
	end

end
