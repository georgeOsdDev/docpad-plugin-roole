# Export Plugin
module.exports = (BasePlugin) ->
	# Define Plugin
	class RoolePlugin extends BasePlugin
		# Plugin name
		name: 'roole'

		# Plugin config
		config:
			indent: "\t"
			percision: 3
			prefix:["o", "ms", "moz", "webkit"]

		# Render some content
		render: (opts,next) ->
			# Prepare
			{inExtension,outExtension,content} = opts

			# Check extensions
			if inExtension is 'roo' and outExtension is 'css'
				# Load stylus
				roole = require('roole')

				roole.compile content,@config,(err,output)->
					# Check for errors, and return to docpad if so
					return next(err)  if err
					# Apply result
					opts.content = output
					# Done, return to docpad
					return next()

			# Some other extension
			else
				# Nothing to do, return back to DocPad
				return next()
