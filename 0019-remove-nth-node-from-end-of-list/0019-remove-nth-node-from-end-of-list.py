# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def removeNthFromEnd(self, head, n):
        """
        :type head: Optional[ListNode]
        :type n: int
        :rtype: Optional[ListNode]
        """
        dummy = ListNode(0)
        dummy.next = head
        fast = dummy
        slow = dummy
        
        # Move the fast pointer n steps ahead
        for _ in range(n):
            fast = fast.next
        
        # Move both fast and slow pointers until fast reaches the end
        while fast.next:
            fast = fast.next
            slow = slow.next
        
        # Now slow is just before the node to be deleted
        slow.next = slow.next.next
        
        # Return the head (which might be the original head or a new one if the first node is removed)
        return dummy.next                                               
        