class Item

    attr_accessor :title, :deadline, :description

    def self.valid_date?(date_str)
        arr = date_str.split("-")
        return false if arr[1].to_i > 12 || arr[2].to_i > 31
        true
    end

    def initialize(title, deadline, description)
        @title = title
        @description = description
        @deadline = deadline
        raise "invalid date" if !Item.valid_date?(@deadline)
    end

    def title=(new_title)
        @title = new_title
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise "invalid date"
        end
    end

    def description=(new_description)
        @description = new_description
    end

end