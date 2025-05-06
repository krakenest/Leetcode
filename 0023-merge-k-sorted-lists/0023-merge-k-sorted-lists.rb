# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
  # Min-heap with [node value, index, node]
  heap = []
  
  lists.each_with_index do |node, i|
    heap << [node.val, i, node] if node
  end

  heap.sort_by!(&:first) # Initialize min-heap

  dummy = ListNode.new(0)
  current = dummy

  while !heap.empty?
    # Extract the smallest node
    val, i, node = heap.shift
    current.next = node
    current = current.next

    # If there's a next node, push it into the heap
    if node.next
      insert_heap(heap, [node.next.val, i, node.next])
    end
  end

  dummy.next
end

def insert_heap(heap, new_item)
  idx = heap.bsearch_index { |x| x[0] > new_item[0] } || heap.size
  heap.insert(idx, new_item)
end