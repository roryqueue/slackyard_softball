desc "This task is called by the Heroku scheduler add-on"
task play_seasons: :environment do

  puts "Clearing yesterday's data..."

  Game.destroy_all

  puts "Playing new seasons..."

  League.find_each do |league|
    Season.new(league)
  end

  puts "Seasons complete."
end

