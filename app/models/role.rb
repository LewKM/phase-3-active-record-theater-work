class Role < ActiveRecord::Base
    has_many :auditions

    def auditions
        Audition.where(role_id: self.id)
    end

    def actors
        self.auditions.map do |audition|
            audition.actor
        end
    end

    def locations
        self.auditions.map do |audition|
            audition.location
        end
    end

    def lead
        # returns the first instance of the audition that was hired for this role or returns a string 'no actor has been hired for this role'
        got_hired = self.auditions.find(&:hired)
        if (got_hired)
            return got_hired
        else
            return 'no actor has been hired for this role'
        end
    end

    def understudy
        # returns the first instance of the audition that was hired for this role or returns a string 'no actor has been hired for this role'
        filtered_auditions = self.auditions.filter do |audition|
            audition.hired
        end

        if (filtered_auditions.length > 1)
            return filtered_auditions.second
        else
            return 'no actor has been hired for understudy for this role'
        end
    end
end
