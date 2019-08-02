MSSQL = YAML.load_file(File.join(Rails.root, "config", "mssql-server_database.yml"))[Rails.env.to_s]
