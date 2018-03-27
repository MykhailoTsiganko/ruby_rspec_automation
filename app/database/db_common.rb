require_relative '../../lib/utilities/docker_api'
module AppDatabase
  class DbCommon
    def self.db_config(database)
      config = {adapter: 'mysql2',
                host: $app_db_host,
                username: 'test_db',
                password: $db_password,
                port: $app_db_port,
                pool: 250,
                timeout: 10000,
                checkout_timeout: 20,
                database: db_name(database)}
      config
    end
  end
end