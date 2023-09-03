class Item
    attr_accessor :title, :description

    def self.valid_date?(date_string)
        split = date_string.split("-")
        year = split[0]
        month = split[1] 
        day = split[2]
        if year.length < 4
            return false
        elsif month.to_i > 12
            return false
        elsif day.to_i > 31
            return false
        end
        true
    end

    def initialize(title, deadline, description, done=false)
        if !Item.valid_date?(deadline)
            raise ArgumentError.new("not a valid deadline")
        end
        @title = title
        @deadline = deadline
        @description = description 
        @done = done
    end

    def done
        @done
    end

    def deadline
        @deadline
    end

    def deadline=(str)
        if !Item.valid_date?(str)
            raise ArgumentError.new("not a valid deadline")
        end
        @deadline = str 
    end

    def toggle
        if @done == false
            @done = true
        else
            @done = false
        end
    end
end

# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false

# p Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

# p Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'You require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )

# p Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# ) # raises error due to invalid date

# Item.new('Fix login page', '2019-10-42', 'It loads slow.')
# my_item = Item.new('Fix login page', '2019-10-22', 'It loads slow.')
# p my_item.title
# puts
# my_item.description = 'It loads waaaaaay too slow!'
# p my_item.description
# puts
# p my_item
# puts
# # my_item.deadline = "10-23-2019"
# # p my_item.deadline
# # puts
# my_item.deadline = "2019-10-23"
# p my_item.deadline
# puts
# p my_item
# puts

