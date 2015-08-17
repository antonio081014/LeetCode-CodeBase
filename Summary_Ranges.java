/**
 * Problem: https://leetcode.com/problems/summary-ranges/
 */

public class Solution {
    public List<String> summaryRanges(int[] nums) {
        List<String> list = new ArrayList<String>();
        for(int i=0; i<nums.length;) {
            int j = i+1;
            for(;j<nums.length; j++) {
                if(nums[j] - nums[j-1] == 1) continue;
                else break;
            }
            if (i+1 == j) {
                list.add("" + nums[i]);
            } else {
                list.add("" + nums[i] + "->" + nums[j-1]);
            }
            i = j;
        }
        return list;
    }
}
