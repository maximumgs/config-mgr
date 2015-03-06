## Configuration Manager

The is a general purpose class, used to read a basic configuration file.

## Usage

Initialize the Configuration Manager

    config_mgr = ConfigMgr.new("config_file_path")

Get a hash of all configuration variables

	config_mgr.get_vars

Get the specified configuration variable

	config_mgr.get_var(:config_var_name)
