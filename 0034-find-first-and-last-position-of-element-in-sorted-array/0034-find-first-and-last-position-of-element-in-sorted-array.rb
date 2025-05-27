# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
    ans = [] 
    low = 0 
    high = nums.length

        while low < high 
            mid = low + (high - low) / 2 


            if nums[mid] == target
                ans << mid 
                high = mid
            elsif nums[mid] < target 
                low = mid + 1
            elsif nums[mid] > target 
                high = mid 
            end 
        end 
        ans1 = []
        ans1 << ans.min

        low = 0 
        high = nums.length 
        while low < high
            mid = low + (high - low) / 2 


            if nums[mid] == target
                ans << mid 
                low = mid + 1
            elsif nums[mid] < target 
                low = mid + 1
            elsif nums[mid] > target 
                high = mid
            end 
        end 
        ans1 << ans.max


        
        if ans.empty? 
            ans << -1 
            ans << -1 
            return ans
        end 
        
        return ans1


end
nums =  [2,2]
target = 1
p search_range(nums, target)

