# Export
module.exports = (BasePlugin) ->
  # Define
	class basicAuthPlugin extends BasePlugin
		# Name
		name: 'basicauth'

		dConf = docpad.getConfig()
		
		# Server Extend
		# Used to add our own custom routes to the server before the docpad routes are added
		serverExtend: (opts) ->
			{express,server} = opts
			{config,docpad} = @
			# docpad = @docpad

			# Synchronous
			auth = express.basicAuth(dConf.basicAuth.user, dConf.basicAuth.pass)

			server.get dConf.basicAuth.protectedPage, auth

			# Done
			@
