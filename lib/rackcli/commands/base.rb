module PackRackCLI

	def self.load_config
		YAML.load_file(File.join(File.dirname(__FILE__), 
														 '../../../config/config.yml'))
	end

	class Base < Thor

		attr_reader :config

		def initialize(*args)
			super
			@config = PackRackCLI.load_config
		end

		no_commands do

			def rack_connect
				@client = Fog::Compute.new(
					:provider => 'rackspace',
					:rackspace_username => @config['client']['username'],
					:rackspace_api_key => @config['client']['api_key'],
					:rackspace_region => @config['client']['region']
				)
			end

			def rack_storage_connect
				@clientStorage = Fog::Storage.new({
					:provider            => 'Rackspace',
					:rackspace_username  => @config['clientStorage']['username'],
					:rackspace_api_key   => @config['clientStorage']['api_key'],
					:rackspace_auth_url  => Fog::Rackspace::UK_AUTH_ENDPOINT,
					:rackspace_region    => :lon,
				})
			end

			def get_servers(pattern = '.*', nets = false)
				servers = []
				begin
					rack_connect
					@client.servers.all.each do |server|
						if /#{pattern}/ =~ server.name
							servers << { "#{server.name}" => {"id" => "#{server.id}" } }
							if nets
								networks = []
								server.addresses.keys.each do |key|
									networks << { "#{key}" => server.addresses["#{key}"][0]['addr']}
								end
								servers[-1]["#{server.name}"]['networks'] = networks
							end
						end
					end
				rescue RegexpError => msg
					puts "Error in the regex"
					puts msg
				end
				servers
			end

			def get_networks(pattern = '.*')
				networks = []
				begin
					rack_connect
					@client.networks.all.each do |network|
						next if network.label == "public" || network.label == "private"
						if /#{pattern}/ =~ network.label
							networks << { "#{network.label}" => { 
								"id" => "#{network.id}", 
								"cidr" => "#{network.cidr}" } }
						end
					end
				rescue RegexpError => msg
					puts "Error in the regex"
					puts msg
				end
				networks
			end

		end

	end

end
