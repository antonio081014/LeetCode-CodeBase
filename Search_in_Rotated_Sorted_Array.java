public class Solution {
    public int search(int[] nums, int target) {
        if(nums.length == 1) return nums[0] == target ? 0 : -1;
        int left = -1;
        int right = -1;
        for(int i=0; i+1<nums.length; i++) {
            if(nums[i] > nums[i+1]) {
                left = bsearch(nums, target, 0, i);
                right = bsearch(nums, target, i+1, nums.length-1);
                if(left == -1 && right == -1) return -1;
                else if(left == -1) return right;
                else if(right == -1) return left;
                return -1;
            }
        }
        return bsearch(nums, target, 0, nums.length-1);
    }
    
    private int bsearch(int[] n, int target, int left, int right) {
        while(left <= right) {
            int mid = (left + right) / 2;
            if(n[mid] == target) return mid;
            if(n[mid] < target) left = mid + 1;
            else right = mid - 1;
        }
        return -1;
    }
}
