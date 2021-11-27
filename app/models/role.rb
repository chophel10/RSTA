class Role < ApplicationRecord
    @@admin = 1
    @@customercare = 2
    @@complainer = 3

    def self.admin
        @@admin
    end
    def self.customercare
        @@customercare
    end
    def self.complainer
        @@complainer
    end
end
