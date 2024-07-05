---@diagnostic disable: undefined-global

return {
  s('req', fmt("local {} = require('{}')", { i(1, 'name'), rep(1) })),
}
