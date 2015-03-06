class ConfigMgr
	def initialize(path)
		begin
			@config_vars = Hash.new

			# Iterate each line in the config file
			IO.foreach(path) do |line|
				# Do not include comments, or lines with multiple assignment operators
				if !line.start_with?("#") && line.count('=') == 1
					name = line.split('=').map(&:strip)[0].to_sym
					value = line.split('=').map(&:strip)[1]

					if name.length > 0 && value.length > 0
						# Add the config variable to the hash
						@config_vars[name] = convert(value)
					end
				end
			end
		rescue Exception => e
			# For testing purposes only, replace with error logging
			puts e
		end
	end

	# The purpose of this method is to convert the passed configuration value to the
	# appropriate data type.
	def convert(value)
		return true if self == true || value.match(/^(true|yes|on)$/i)
		return false if self == false || value.match(/^(false|no|off)$/i)
		return (float = Float(value)) && (float % 1.0 == 0) ? float.to_i : float rescue value
	end

	# The purpose of this method is to return a config value base on the specified name
	def get_var(name)
		@config_vars[name]
	end

	# The purpose of this method is to return the complete config hash
	def get_vars
		@config_vars
	end
end
