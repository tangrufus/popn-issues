desc "This task is called by the Heroku scheduler add-on"
task schedule_crawlers: :environment do
  puts "Scheduling crawlers..."
    KpopnModifiedPostsCrawlerJob.perform_later
    KpopnLatestPostsCrawlerJob.perform_later
    KpopnLatestPostsCrawlerJob.set(wait: 5.minutes).perform_later
    ApopnModifiedPostsCrawlerJob.set(wait: 6.minutes).perform_later
    ApopnLatestPostsCrawlerJob.set(wait: 7.minutes).perform_later
  puts "Scheduled."
end