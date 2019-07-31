MARIADB = YAML.load_file(File.join(Rails.root, "config", "mariadb_database.yml"))[Rails.env.to_s]
