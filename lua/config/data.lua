local M = {
  icons = {
    dap = {
      Stopped = { " ", "DiagnosticWarn", "DapStoppedLine" },
      Breakpoint = " ",
      BreakpointCondition = " ",
      BreakpointRejected = { " ", "DiagnosticError" },
      LogPoint = ".>",
    },
    diagnostics = {
      Error = " ",
      Warn = " ",
      Hint = " ",
      Question = " ",
      Info = " ",
    },
    git = {
      added = " ",
      modified = " ",
      removed = " ",
      ignore = " ",
      rename = " ",
      diff = " ",
      repo = " ",
      octoface = " ",
    },
    kinds = {
      Array = " ",
      Boolean = "蘒 ",
      Class = " ",
      Color = " ",
      Constant = " ",
      Constructor = " ",
      Copilot = " ",
      Enum = "",
      EnumMember = " ",
      Event = " ",
      Field = " ",
      File = " ",
      Files = " ",
      Folder = " ",
      FolderOpen = "",
      Function = " ",
      Interface = " ",
      Key = " ",
      Keyword = " ",
      Method = " ",
      Module = " ",
      Namespace = " ",
      Null = " ",
      Number = " ",
      Object = " ",
      Operator = " ",
      Package = " ",
      Property = " ",
      Reference = " ",
      Snippet = " ",
      String = " ",
      Struct = " ",
      Text = " ",
      TypeParameter = " ",
      Unit = " ",
      Value = " ",
      Variable = " ",
    },
    ui = {
      Arrow = "",
      ArrowClosed = "",
      ArrowOpen = "",
      Lock = "",
      Circle = "",
      BigCircle = "",
      BigUnfilledCircle = "",
      Close = "",
      NewFile = "",
      Search = "",
      Lightbulb = "",
      Project = "",
      Dashboard = "",
      History = "",
      Comment = "",
      Bug = "",
      Code = "",
      Telescope = "",
      Gear = "",
      Package = "",
      List = "",
      SignIn = "",
      SignOut = "",
      Check = "",
      Fire = "",
      Note = "",
      BookMark = "",
      Pencil = "",
      ChevronRight = "",
      -- ChevronRight = ">",
      Table = "",
      Calendar = "",
      CloudDownload = "",
    },
    misc = {
      Robot = "ﮧ",
      Squirrel = "",
      Tag = "",
      Watch = "",
      Smiley = "ﲃ",
      Package = "",
      CircuitBoard = "",
    },
  },
}

return M
