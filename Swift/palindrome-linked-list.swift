/**
 * https://leetcode.com/problems/palindrome-linked-list/
 * 
 * 
 */ 
// Date: Mon May  4 23:13:56 PDT 2020
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    /// - Complexity:
    ///     - Time: O(n)
    ///     - Space: O(n), space used to reverse the new created ListNode.
    ///
    func isPalindrome(_ head: ListNode?) -> Bool {
        var head1 = head
        var head2 = reverseList(head)
        // printNode(head1)
        // printNode(head2)
        while head1 != nil, head2 != nil {
            if head1?.val != head2?.val { return false }
            head1 = head1?.next
            head2 = head2?.next
        }
        return true
    }
    
    private func reverseList(_ head: ListNode?) -> ListNode? {
        guard let h = head else { return head }
        var next = h.next
        var head = ListNode(h.val)
        while next != nil {
            let nnext = next?.next
            let node = ListNode(next!.val, head)
            head = node
            next = nnext
        }
        return head
    }
    
    private func printNode(_ head: ListNode?) {
        guard let head = head else { return }
        print(" \(head.val) ")
        self.printNode(head.next)
    }
}
