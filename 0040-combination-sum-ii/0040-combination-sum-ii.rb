# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum2(candidates, target)
    res_array = []
    return [candidates] if candidates.sum == target 
    return [] if candidates.sum < target 
    temp_hash = {}
    candidates.each{|num| temp_hash[num] = candidates.count(num)}
    back_track(candidates, target,temp_hash , [], res_array, 0)
end

def back_track(candidates, target, temp_hash, temp, res_array, start)  
  if temp.sum == target and !res_array.include?(temp) 
    res_array.push(temp.dup)
    return 
  end   
 
 candidates.uniq[start..candidates.uniq.length-1].each_with_index do |num, i|     
   next if (num + temp.sum > target || temp_hash[num] == 0)    
   temp.push(num)   
   temp_hash[num] -= 1
   back_track(candidates, target, temp_hash, temp.sort, res_array, start+i)  
   temp_hash[temp.last] += 1
   temp.pop     
 end 
  
  return res_array 
end 