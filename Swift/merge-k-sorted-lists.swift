/**
 * Problem Link: https://leetcode.com/problems/merge-k-sorted-lists/
 *
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    /**
     * Time Complex: O(kN),
     *  k is the number of ListNode in single linked list.
     *  N is the number of linked list.
     *
     * In other words, it's Linear. Going through every elements(ListNode) in the lists.
     * 
     * But the system won't pass, giving TLE.
     */
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let head = ListNode(0)
        var node = head
        var list = lists
        
        while true {
            var index = -1
            var i = 0
            while i < list.count {
                if list[i] != nil {
                    if index == -1 || list[i]!.val < list[index]!.val {
                        index = i
                    }
                    i += 1
                } else {
                    list.remove(at: i)
                }
            }
            if index == -1 {
                break
            } else {
                node.next = ListNode(list[index]!.val)
                list[index] = list[index]!.next
                node = node.next!
            }
        }
        return head.next
    }
    
    /// Still TLE.
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var head: ListNode? = nil
        for list in lists {
            head = mergeTwoList(head, list)
        }
        return head
    }
    
    /// Function here merge two ListNode list, then return the combined list.
    private func mergeTwoList(_ ll1: ListNode?, _ ll2: ListNode?) -> ListNode? {
        var list1 = ll1
        var list2 = ll2
        if list1 == nil {
            return list2
        }
        if list2 == nil {
            return list1
        }
        let head = ListNode(0)
        var node = head
        while list1 != nil || list2 != nil {
            if let l1 = list1, let l2 = list2 {
                if l1.val <= l2.val {
                    node.next = ListNode(l1.val)
                    list1 = l1.next
                } else {
                    node.next = ListNode(l2.val)
                    list2 = l2.next
                }
            } else if let l1 = list1 {
                node.next = ListNode(l1.val)
                list1 = l1.next
            } else if let l2 = list2 {
                node.next = ListNode(l2.val)
                list2 = l2.next
            }
            node = node.next!
        }
        return head.next
    }
}
