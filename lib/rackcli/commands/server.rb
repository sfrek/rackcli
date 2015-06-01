module PackRackCLI

	class Server < Base

		desc "attach fqdn network1 ... networkN", "attach networks to a server"
		def attach(fqdn,*networks)
			puts get_servers(fqdn).to_yaml
		end
	
		desc "list [pattern] [--nets] [--json]", "list all servers"
		option :nets
		option :json
		def list(fqdn = ".*")
			nets = true if options[:nets]
			nets = get_servers(fqdn,nets)
			if options[:json]
				puts JSON.pretty_generate(JSON.parse(nets.to_json))
			else
				puts nets.to_yaml
			end
		end
	end

end
