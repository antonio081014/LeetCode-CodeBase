/**
 * Problem: https://leetcode.com/problems/contains-duplicate/
 * 
 * 1, Using HashSet to keep the record of every integer which has been visited.
 * O(n) in computing and space.
 * 
 * 
 */

public class Solution {
    public boolean containsDuplicate(int[] nums) {
        HashSet<Integer> set = new HashSet<Integer>();
        for(int x : nums) {
            if(set.contains(x)) return true;
            set.add(x);
        }
        return false;
    }
}
