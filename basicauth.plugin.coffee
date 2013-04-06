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
			auth = serverExpress.basicAuth(config.testUser, config.testPass)

			# Synchronous Function
			auth = serverExpress.basicAuth((user, pass) ->
				user is "testUser" and pass is "testPass"
			)

			server.get config.protectedPage, auth, (req, res) ->
				res.send docpad

			# Done
			@
