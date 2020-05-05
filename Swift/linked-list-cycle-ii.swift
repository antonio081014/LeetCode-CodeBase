/**
 * https://leetcode.com/problems/linked-list-cycle-i/
 * 
 * 
 */ 
// Date: Tue May  5 14:12:28 PDT 2020
/**
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
    /// Reference: https://leetcode.com/problems/linked-list-cycle-ii/discuss/44781/Concise-O(n)-solution-by-using-C%2B%2B-with-Detailed-Alogrithm-Description
    /// Step 2: If there is a cycle, return the entry location of the cycle
    ///    2.1) L1 is defined as the distance between the head point and entry point
    ///
    ///    2.2) L2 is defined as the distance between the entry point and the meeting point
    ///
    ///    2.3) C is defined as the length of the cycle
    ///
    ///    2.4) n is defined as the travel times of the fast pointer around the cycle When the first encounter of the slow pointer and the fast pointer
    ///
    ///    According to the definition of L1, L2 and C, we can obtain:
    ///
    ///    the total distance of the slow pointer traveled when encounter is L1 + L2
    ///
    ///    the total distance of the fast pointer traveled when encounter is L1 + L2 + n * C
    ///
    ///    Because the total distance the fast pointer traveled is twice as the slow pointer, Thus:
    ///
    ///    2 * (L1+L2) = L1 + L2 + n * C => L1 + L2 = n * C => L1 = (n - 1) C + (C - L2)*
    ///
    ///    It can be concluded that the distance between the head location and entry location is equal to the distance between the meeting location and the entry location along the direction of forward movement.
    ///
    ///    So, when the slow pointer and the fast pointer encounter in the cycle, we can define a pointer "entry" that point to the head, this "entry" pointer moves one step each time so as the slow pointer. When this "entry" pointer and the slow pointer both point to the same location, this location is the node where the cycle begins.
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        while fast != nil, fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if fast === slow {
                fast = head
                while fast !== slow {
                    fast = fast?.next
                    slow = slow?.next
                }
                return fast
            }
        }
        return nil
    }
}


