local Config  = {
  SAORI = {
    os_detect = [[saori\os_detect\os_detect.dll]],
  },
  Replace = {
    {
      before  = [[、]],
      after   = [[、\w9]],
    },
    {
      before  = [[、@]],
      after   = [[、]],
    },
    {
      before  = [[。]],
      after   = [[。\w9\w9]],
    },
    {
      before  = [[。@]],
      after   = [[。]],
    },
    {
      before  = [[…]],
      after   = [[…\w9]],
    },
    {
      before  = [[…@]],
      after   = [[…]],
    },
    {
      before  = [[？@]],
      after   = [[？\w9\w9]],
    },
    {
      before  = [[！@]],
      after   = [[！\w9\w9]],
    },
  },
  External  = {
  },
}

return Config
