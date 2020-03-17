namespace :batch do
  desc "Check if space has expired and if so update active status"
  task check_expiration: :environment do
    # Space.where(active: true).each(&:expired?)
    expired_spaces = Space.where(active: true).select(&:expired?)
    expired_spaces.each { |space| puts "Space #{space.id} has just expired." }
    # expired_spaces.each { |space| active: false}
  end

end
