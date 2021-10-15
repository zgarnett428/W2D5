require_relative "item"

class List

    attr_accessor :label, :items

    def initialize(label)
        @label = label
        @items = []
    end

    def label=(new_label)
        @label = new_label
    end

    def add_item(title, deadline, *description)
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true
        end
        false
    end

    def size
        @items.length
    end

    def valid_index?(index)
        @items.each.with_index { |ele, i| return true if i == index}
        false
    end

    def swap(index_1, index_2)
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        end
        false
    end

    def [](index)
        return nil if !valid_index?(index)
        @items[index]
    end

    def priority
        @items[0]
    end

    def print
        puts "\n------------------------------------------\n                #{@label.upcase}\n------------------------------------------"
        puts "  Index   Item                  Deadline\n------------------------------------------"
        @items.each.with_index { |item, i| puts "   #{i}      #{item.title}         #{item.deadline}" }
        puts "------------------------------------------"
    end

    def print_full_item(i)
        puts "\n------------------------------------------"
        puts "#{@items[i]}                    #{@items[i].deadline}\n#{@items[i].description}"
        puts "------------------------------------------\n"
    end

    def print_priority
        print_full_item(0)
    end

    def up(i, amt = 1)
        

    end


end