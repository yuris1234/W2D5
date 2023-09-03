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
        print @label.rjust(23)
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

    def print_full_item(index)
        if !valid_index?(index)
            return
        end
        print "-" * 35
        puts
        print "#{@items[index].title.ljust(20)} + #{@items[index].deadline}"
        puts
        print "#{@items[index].description}"
        puts
        print "-" * 35
        puts
    end

    def print_priority
        print "-" * 35
        puts
        print "#{@items[0].title.ljust(20)} + #{@items[0].deadline}"
        puts
        print "#{@items[0].description}"
        puts
        print "-" * 35
        puts
    end

    def up(index, amount=1)
        if !valid_index?(index)
            return false
        end
        amount.times do
            if index > 0
                @items[index], @items[index-1] = @items[index-1], @items[index]
            index-=1
            end
        end
        true
    end

    def down(index, amount=1)
        if !valid_index?(index)
            return false
        end
        amount.times do 
            if index < @items.length - 1
                @items[index], @items[index+1] = @items[index+1], @items[index]
            index+=1
            end
        end
        true
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end
end

# my_list = List.new('Groceries')
# my_list.add_item('cheese', '2019-10-25', 'Get American and Feta for good measure.')
# my_list.add_item('toothpaste', '2019-10-25')
# my_list.add_item('shampoo', '2019-10-24')
# my_list.add_item('candy', '2019-10-31', '4 bags should be enough')
# my_list.prints
# my_list.print_full_item(3)
# my_list.print_priority

l = List.new('Groceries')
l.add_item('cheese', '2019-10-25')
l.add_item('toothpaste', '2019-10-25')
l.add_item('shampoo', '2019-10-24')
l.add_item('candy', '2019-10-31')
# l.down(0)
# l.down(0, 2)
# l.up(3, 10)
# p l.up(7, 3)
# l.sort_by_date!
# l.prints