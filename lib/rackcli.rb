require 'thor'
require 'json'
require 'yaml'
require 'fog'
require 'base64'
require 'rackcli/commands'
require 'ap'

module PackRackCLI

	class CLI < Thor

		desc "info", "info from connection"
		subcommand "info", Info

		desc "network", "command for the network(s)"
		subcommand "network", Network

		desc "server", "command for the server(s)"
		subcommand "server", Server

		desc "attachment", "command for the attachment(s)"
		subcommand "attachment", Attachment

		desc "dns", "command for dns"
		subcommand "dns", DNS

		desc "cdn", "command for cdn"
		subcommand "cdn", CDN

		desc "images", "command for images"
		subcommand "images", Images

		desc "flavor", "command for flavor"
		subcommand "flavor", Flavor
	end
end
