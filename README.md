###### [Express' basicAuth()](http://expressjs.com/3x/api.html#middleware) as a [DocPad](http://docpad.org/ "DocPad") plugin.

### Setup

Add the protected route and user/pass info to the docpad.coffee configuration file like so:

```
express = require('express') 
authMiddleware = express.basicAuth (user, pass) -> 
    return user is 'super' and pass is 'secret'

docpadConfig = {


plugins:
    basicauth:
        protectedPage: '/admin.html'
        user: 'testUser'
        pass: 'testPass'

events:
    serverExtend: (opts) ->
        docpad = @docpad

        opts.serverExpress.use (req,res,next) =>
            cleanUrl = req.url.replace(/\?.*/,'')
            file = docpad.getFileByUrl(req.url) or docpad.getFileByUrl(cleanUrl)

            return next()  unless file?.get('protected')

            return authMiddleware(req,res,next)
}
module.exports = docpadConfig
```

And that's it for now! 
 
