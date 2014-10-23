express = require 'express'

# Export
module.exports = (BasePlugin) ->
	# Define
	class BasicAuthPlugin extends BasePlugin
		# Name
		name: 'basicauth'
		
		# Config
		config:
			user: null
			pass: null
			match: null

		# Server Extend
		serverExtend: (opts) ->
			# Prepare
			{server} = opts
			config = @getConfig()
			
			# Create our authentication middleware
			authMiddleware = express.basicAuth(config.user, config.pass)
			
			# If we only want to apply to certain URLs do so
			if config.match
				server.all(config.match, authMiddleware)
			
			# Otherwise apply to everything
			else
				server.use(authMiddleware)
			
			# Done
			@
