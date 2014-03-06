SETTINGS = YAML.load_file("#{Rails.root.to_s}/config/settings.yml")
AlchemyAPI.key = SETTINGS["alchemy_api_key"]
