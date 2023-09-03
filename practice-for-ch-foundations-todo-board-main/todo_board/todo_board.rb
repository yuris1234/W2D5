require_relative "./list.rb"

class TodoBoard
    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        print "\nEnter a command: "
        puts
        get = gets.chomp
        cmd, *args = get.split(" ")
        nums = args.map {|ele| ele.to_i}
        
        case cmd
        when "mktodo"
            @list.add_item(*args)
            return true
        when "up"
            @list.up(*nums)
            return true
        when "down"
            @list.down(*nums)
            return true
        when "swap"

            @list.swap(*nums)
            return true
        when "priority"
            @list.print_priority 
            return true
        when "sort"
            @list.sort_by_date!
            return true
        when "prints"
            if args.length > 0
                @list.print_full_item(*nums)
            else
                @list.prints
            end
            return true
        when "quit"
            return false
        end
    end

    def run
        prompt = true
        while prompt
            prompt = false
            if get_command
                prompt = true
            end
        end
    end


end

# my_board = TodoBoard.new('groceries')
# my_board.run