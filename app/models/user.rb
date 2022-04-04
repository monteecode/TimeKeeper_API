class User < ApplicationRecord
    has_many :user_times
    def isDateDuplicated?(date)
        #self.user_times.none?{ |day_time| binding.pry day_time.clock_in.to_s.slice(8, 2) == date }
        self.user_times.none? do |day_time|
            day_time.clock_in.to_s.slice(9, 1).to_i == date
        end
    end
end