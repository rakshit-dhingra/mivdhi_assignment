require 'csv'
namespace :load_data do
  desc 'Load coaches data from CSV'
  task coaches: :environment do
    file_path = 'data.csv'
    
    CSV.foreach(file_path, headers: true) do |row|
      coach = Coach.find_or_create_by(name: row['Name'], timezone: row['Timezone'])
      Time.zone = coach.timezone.split(' ').drop(1).join(' ')
      CoachAvailability.create(
        coach: coach,
        day_of_week: row['Day of Week'],
        available_at: row['Available at'],
        available_until: row['Available until']
      )
    end
  end
end
