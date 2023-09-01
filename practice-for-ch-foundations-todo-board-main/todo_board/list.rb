require_relative "./item.rb"

class List
    attr_accessor :label

    def initialize(label)
        @label = label 
        @items = []
    end

    def add_item(title, deadline, description="")
        if !Item.valid_date?(deadline)
            return false 
        else
            item = Item.new(title, deadline, description)
            @items << item
            return true
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        index <= self.size - 1 && index >= 0
    end

    def swap(index_1, index_2)
        if !valid_index?(index_1) || !valid_index?(index_2)
            return false
        else
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        end
    end

    def [](index)
        if !valid_index?(index)
            return nil
        end
        @items[index]
    end

    def priority
        @items[0]
    end

    def prints
        print "-" * 35
        puts
        print @label
        puts
        print "-" * 35
        puts
        print "Index".ljust(5) + " | " + "Item".ljust(15) + " | " + "Deadline" 
        puts
        print "-" * 35
        puts
        @items.each_with_index do |item, idx|
            print "#{idx.to_s.ljust(5)} | #{item.title.ljust(15)} | #{item.deadline}" 
            puts
        end
        print "-" * 35
        puts 
    end
end

# my_list = List.new('Groceries')
# my_list.add_item('cheese', '2019-10-25', 'Get American and Feta for good measure.')
# my_list.add_item('toothpaste', '2019-10-25')
# my_list.add_item('shampoo', '2019-10-24')
# my_list.add_item('candy', '2019-10-31', '4 bags should be enough')
# my_list.prints