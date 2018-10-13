class Grid
    def self.organize_left(amount,counter)

        return true if (amount <= 3 || counter == 1) || (amount == counter)

        bucket_min_amount = amount / 3
        bucket_remainder = amount % 3
        buck_array = [bucket_min_amount,bucket_min_amount,bucket_min_amount]

        buck_array.each_with_index do |element,i|
            buck_array[i] += 1 if bucket_remainder > 0
            bucket_remainder -= 1 if bucket_remainder > 0
        end
        tracker = 0
        buck_array.each_with_index do |element,i|
            tracker += buck_array[i] 
            return true if tracker + 1 == counter
        end
        return false
        # 1 - 1 0 0
        # 2 - 1 1 0
        # 3 - 1 1 1
        # 4 - 2 1 1
            # 1 2
            # 3
            # 4
        # 5 - 2 2 1
            # 1 2
            # 3 4
            # 5
        # 6 - 2 2 2
    end
end