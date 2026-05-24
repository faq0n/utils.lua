# faq0n's custom lua utils

Place utils.lua into project folder to have access to helper functions after local import
``` 
  local utils = require("utils)
  local prompt = utils.require_local("prompt")
```

Otherwise activate imports in utils.lua to not lazy load helper functions
