# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def reverse_k_group(head, k)
    dummy = ListNode.new(0)
    dummy.next = head
    group_prev = dummy

    while true
        kth = get_kth_node(group_prev, k)
        break unless kth

        group_next = kth.next
        prev = kth.next
    curr = group_prev.next

        while curr != group_next
            tmp = curr.next
            curr.next = prev
            prev = curr
            curr = tmp
        end

        tmp = group_prev.next
        group_prev.next = kth
        group_prev = tmp
    end
    dummy.next
end

def get_kth_node(curr, k)
    while curr && k > 0
        curr = curr.next
        k -= 1
    end
    curr
end