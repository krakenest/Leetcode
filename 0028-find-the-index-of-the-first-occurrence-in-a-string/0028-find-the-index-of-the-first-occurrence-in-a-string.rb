# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
    return 0 if haystack == needle

    return -1 if haystack.length < needle.length

    for i in 0...(haystack.length-needle.length+1)
        if(haystack[i,needle.length] == needle)
            return i
        end
    end

    return -1
end