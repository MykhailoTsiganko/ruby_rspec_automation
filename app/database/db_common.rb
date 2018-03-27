require_relative '../../lib/utilities/docker_api'
module AppDatabase
  class DbCommon

    if $use_ssh
      app_db_gateway = Net::SSH::Gateway.new($ssh_host, 'ubozhenko', :password => '8mbnDo421')
      port = 33308
      begin
        app_db_port = app_db_gateway.open($ssh_db_api, $db_port, port)
      rescue StandardError => error
        puts error.message
        port +=1
        retry
      end

      $ssh_tunnels << {name: 'app_db', gateway: app_db_gateway, port: app_db_port}
      $app_db_host = '127.0.0.1'
      $app_db_port = app_db_port
    end

    def self.db_config(database)
      config = {adapter: 'mysql2',
                host: $app_db_host,
                username: db_username(database),
                password: $db_password,
                port: $app_db_port,
                pool: 250,
                timeout: 10000,
                checkout_timeout: 20,
                database: db_name(database)}
      config
    end

    def self.db_name(database)
      database = trim_gateway(database)
      if ENVIRONMENT.include?('sandbox')
        return "#{database}_production"
      elsif ENVIRONMENT.include?('uat')
        return "mvp_#{database}_uat"
      elsif ENVIRONMENT.include?('stage')
        return "mvp_#{database}_staging"
      end
    end

    def self.db_username(database)
      database = trim_gateway(database)
      if ENVIRONMENT.include?('sandbox')
        return 'root'
      elsif ENVIRONMENT.include?('uat')
        return "mvp_#{database}"
      elsif ENVIRONMENT.include?('stage')
        return "mvp_#{database}"
      end
    end

    def self.trim_gateway(database)
      if (database.include?('gateway') && ENVIRONMENT.include?('sandbox')) || !database.include?('gateway')
        return database
      else
        return 'gateway'
      end
    end

  end
end