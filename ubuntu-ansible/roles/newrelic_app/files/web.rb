require 'json'
require 'securerandom'
require 'sinatra/base'
require 'newrelic_rpm'
require 'mysql2'
require 'mysql2-cs-bind'
require 'bcrypt'
require 'isucari/api'

class Mysql2ClientWithNewRelic < Mysql2::Client
  def initialize(*args)
    super
  end

  def query(sql, *args)
    if ENV['LOCAL']
      s = Time.now
      puts sql
      puts caller(0)[1]
    end
    callback = -> (result, metrics, elapsed) do
      NewRelic::Agent::Datastores.notice_sql(sql, metrics, elapsed)
    end
    op = sql[/^(select|insert|update|delete|begin|commit|rollback)/i] || 'other'
    ##テーブル名を突っ込む
    table = sql[/\bcategories|configs|items|shippings|transaction_evidences|users\b/] || 'other'
    NewRelic::Agent::Datastores.wrap('MySQL', op, table, callback) do
      super
    end
  end
end

helpers do
  def db
    Thread.current[:db] ||= Mysql2ClientWithNewRelic.new(
      'host' => ENV['MYSQL_HOST'] || '127.0.0.1',
      'port' => ENV['MYSQL_PORT'] || '3306',
      'database' => ENV['MYSQL_DBNAME'] || 'isucari',
      'username' => ENV['MYSQL_USER'] || 'isucari',
      'password' => ENV['MYSQL_PASS'] || 'isucari',
      'charset' => 'utf8mb4',
      'database_timezone' => :local,
      'cast_booleans' => true,
      'reconnect' => true,
    )
  end
end
