class Audition < ActiveRecord::Base
    belongs_to :role

    def role
        Role.find(self.role_id)
    end

    def call_back
        # change the the hired attribute to true
        self.hired = true
        self.save
    end
end