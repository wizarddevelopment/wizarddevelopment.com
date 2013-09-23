web_concurrency = Integer(ENV["WEB_CONCURRENCY"] || 4)
listen_port = Integer(ENV['PORT'] || 3000)
backlog_length = Integer(ENV['UNICORN_BACKLOG'] || 64)

timeout 30
preload_app true

worker_processes web_concurrency
listen listen_port, :backlog => backlog_length

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  ActiveRecord::Base.connection.disconnect! if defined?(ActiveRecord::Base)
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  ActiveRecord::Base.establish_connection if defined?(ActiveRecord::Base)

  puts "kid listener on #{set[:listeners].inspect}"
end