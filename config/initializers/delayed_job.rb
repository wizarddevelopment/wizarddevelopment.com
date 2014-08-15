Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.max_attempts = 1
Delayed::Worker.delay_jobs = !(Rails.env.test? || Rails.env.development?)
