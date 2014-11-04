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

___
 
### LICENSE

The MIT License (MIT)

Copyright (c) 2014 Michael Duane Mooring

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
