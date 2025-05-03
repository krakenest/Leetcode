/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
package main

import "fmt"
func mergeTwoLists(list1 *ListNode, list2 *ListNode) *ListNode {
    // Create a dummy node to simplify the merging process
    dummy := &ListNode{}
    current := dummy

    // Traverse both lists and merge them
    for list1 != nil && list2 != nil {
        if list1.Val < list2.Val {
            current.Next = list1
            list1 = list1.Next
        } else {
            current.Next = list2
            list2 = list2.Next
        }
        current = current.Next
    }

    // If there are remaining nodes in either list, append them
    if list1 != nil {
        current.Next = list1
    }
    if list2 != nil {
        current.Next = list2
    }

    // Return the merged list starting from the node after the dummy node
    return dummy.Next
}