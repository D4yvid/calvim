local setup = function ()
	local github_theme = require 'github-theme'

	github_theme.setup {
		inverse = {
			visual = true,
			search = true
		},
		
		darken = {
			floats = true
		}
	}
end

return { setup = setup }
