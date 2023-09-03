require_relative "./list.rb"

class TodoBoard
    def initialize()
        # hash = Hash.new()
        # label.each {|ele| hash[ele] = List.new(ele)}
        @board = Hash.new
    end

    def board
        @board
    end

    def get_command
        print "\nEnter a command: "
        puts
        get = gets.chomp
        cmd, ls, *args = get.split(" ")
        nums = args.map {|ele| ele.to_i}
        
        case cmd
        when "mklist"
            @board[ls] = List.new(ls)
            p @board
            return true
        when "ls"
            print @board.keys
            puts
            return true
        when "showall"
            @board.each {|k, v| v.prints}
            return true
        when "mktodo"
            @board[ls].add_item(*args)
            return true
        when "up"
            @board[ls].up(*nums)
            return true
        when "down"
            @board[ls].down(*nums)
            return true
        when "swap"

            @board[ls].swap(*nums)
            return true
        when "priority"
            @board[ls].print_priority 
            return true
        when "sort"
            @board[ls].sort_by_date!
            return true
        when "prints"
            if args.length > 0
                @board[ls].print_full_item(*nums)
            else
                @board[ls].prints
            end
            return true
        when "toggle"
            @board[ls].toggle_item(*nums)
            return true
        when "rm"
            @board[ls].remove_item(*nums)
            return true
        when "purge"
            @board[ls].purge
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

my_board = TodoBoard.new()
my_board.run