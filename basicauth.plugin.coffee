# Export
module.exports = (BasePlugin) ->
  # Define
	class basicAuthPlugin extends BasePlugin
		# Name
		name: 'basicauth'

		config:
			protectedPage: '/fileuploads'
			user: "testUser"
			pass: "testPass"

		# Server Extend
        # Used to add our own custom routes to the server before the docpad routes are added
		serverExtend: (opts) ->
			{server} = opts
			docpad = @docpad

			# Synchronous
			auth = server.basicAuth(config.user, config.pass)

			req.app.get config.protectedPage, auth

			# Done
			@
