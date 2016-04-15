desc "This task is called by the Heroku scheduler add-on"
task :daily => :environment do
  Event.send_reminders
  Event.repeat_events
  Event.send_invites
end
