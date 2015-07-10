public class Solution {
    public int removeDuplicates(int[] nums) {
        if(nums.length == 0) return 0;
        boolean added = false;
        int index = 1;
        for(int i=1; i<nums.length; i++){
            if(nums[i] == nums[i-1]){
                if(!added) {nums[index++] = nums[i];}
                added = true;
            } else {
                added = false;
                nums[index++] = nums[i];
            }
        }
        return index;
    }
}
