import java.util.*;

/**
 * Problem: https://leetcode.com/problems/two-sum/
 * 
 * Computation Complexity: O(nlog(n))
 * 
 * Travel through the array, then using binary search to find the mate number, which two could sum to target.
 */

public class Solution {
    public int[] twoSum(int[] array, int target) {
        Combo[] nums = new Combo[array.length];
        for(int i=0; i<array.length; i++){
            nums[i] = new Combo(array[i], i);
        }
        Arrays.sort(nums);
        for(int i=0; i<nums.length; i++) {
            int a = target - nums[i].number;
            int j=i+1;
            int k = nums.length-1;
            while(j<=k){
                int mid = (j+k)/2;
                if(a == nums[mid].number) {
                    if(nums[i].index < nums[mid].index) return new int[]{nums[i].index + 1,nums[mid].index + 1};
                    else return new int[]{nums[mid].index + 1,nums[i].index + 1};
                } else if (a>nums[mid].number){
                    j = mid + 1;
                } else {
                    k = mid - 1;
                }
            }
        }
        return new int[2];
    }
}

class Combo implements Comparable{
    public int number;
    public int index;
    
    Combo(int n, int idx) {
        number = n;
        index = idx;
    }
    
    public int compareTo(Object a) {
        Combo other = (Combo)a;
        if(this.number == other.number) return this.index - other.index;
        return this.number - other.number;
    }
 
}
