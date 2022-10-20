require("mkdnflow").setup{
  modules = {
    bib = false
  },
  perspective_priority = {
    priority = "root",
    root_tell = "index.md"
  },
  wrap = false,
  silent = true,
  links = {
    style = "markdown",
    conceal = true,
    implicit_extension = "md"
  },
  mappings = {
    MkdnEnter = {{"n", "v"}, "<cr>"},
    MkdnTab = false,
    MkdnSTab = false,
    MkdnNextLink = {"n", ">>"},
    MkdnPrevLink = {"n", "<<"},
    MkdnNextHeading = {"n", "]]"},
    MkdnPrevHeading = {"n", "[["},
    MkdnGoBack = {"n", "<a-left>"},
    MkdnGoForward = {"n", "<a-right>"},
    MkdnFollowLink = false,
    MkdnDestroyLink = {"n", "<m-cr>"},
    MkdnTagSpan = {"v", "<m-cr>"},
    MkdnMoveSource = {"n", "<f2>"},
    MkdnYankAnchorLink = {"n", "ya"},
    MkdnYankFileAnchorLink = {"n", "yfa"},
    MkdnIncreaseHeading = {"n", "-"},
    MkdnDecreaseHeading = {"n", "+"},
    MkdnToggleToDo = {{"n", "v"}, "<c-cr>"},
    MkdnNewListItem = false,
    MkdnNewListItemBelowInsert = {"n", "o"},
    MkdnNewListItemAboveInsert = {"n", "O"},
    MkdnExtendList = false,
    MkdnUpdateNumbering = false,
    MkdnTableNextCell = false,
    MkdnTablePrevCell = false,
    MkdnTableNextRow = false,
    MkdnTablePrevRow = false,
    MkdnTableNewRowBelow = false,
    MkdnTableNewRowAbove = false,
    MkdnTableNewColAfter = false,
    MkdnTableNewColBefore = false,
    MkdnFoldSection = false,
    MkdnUnfoldSection = false
  }
}
