worker_processes((ENV["WEB_CONCURRENCY"] || 4).to_i)
listen((ENV['PORT'] || 3000).to_i)
timeout((ENV['WEB_TIMEOUT'] || 5).to_i)
preload_app true

before_fork do |_server, _worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  ActiveRecord::Base.connection.disconnect! if defined?(ActiveRecord::Base)
end

after_fork do |_server, _worker|
  puts "Child listener on #{set[:listeners].inspect}"

  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  ActiveRecord::Base.establish_connection if defined?(ActiveRecord::Base)
end
