/**
 * Problem: https://leetcode.com/problems/single-number-iii/
 */

// This method use a Hash Table to store the encurrency of numbers in nums.
public class Solution {
    public int[] singleNumber(int[] nums) {
        int[] ret = new int[2];
        int idx = 0;
        Map<Integer, Integer> map = new HashMap<Integer, Integer>();
        for(int x : nums) {
            if(map.get(x) == null) map.put(x, 0);
            map.put(x, map.get(x) + 1);
        }
        
        for(int k : map.keySet()){
            if(map.get(k) % 2 !=0){
                ret[idx] = k;
                idx++;
            }
        }
        return ret;
    }
}
