/**
 * Problem Link: https://leetcode.com/problems/3sum/
 * 
 * Use ith number as the first number a,
 * then, using two pointers to find the other two numbers.
 */
public class Solution {
    public List<List<Integer>> threeSum(int[] nums) {
        List<List<Integer>> list = new ArrayList<List<Integer>>();
        int n = nums.length;
        if(n < 3) return list;
        
        Arrays.sort(nums);
        
        for(int i=0; i<n-2; i++) {
            // Remove the duplicate numbers.
            if(i==0 || nums[i] != nums[i-1]) {
                int target = -nums[i];
                int p1 = i + 1;
                int p2 = n - 1;
                while(p1 < p2) {
                    if(nums[p1] + nums[p2] == target) {
                        List<Integer> ret = new ArrayList<Integer>();
                        ret.add(nums[i]);
                        ret.add(nums[p1]);
                        ret.add(nums[p2]);
                        list.add(ret);
                        p1++;
                        p2--;
                        // Remove the duplicate numbers.
                        while(p1 < p2 && nums[p1] == nums[p1-1]) p1++;
                        while(p1 < p2 && nums[p2] == nums[p2+1]) p2--;
                    } else if (nums[p1] + nums[p2] > target) {
                        p2--;
                    } else {
                        p1++;
                    }
                }
            }
        }
        return list;
    }
}
