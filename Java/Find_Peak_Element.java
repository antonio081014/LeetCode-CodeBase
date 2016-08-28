/**
 * Find the up trend or down trend.
 */
public class Solution {
    public int findPeakElement(int[] num) {
        int left=0,right=num.length-1;  
        while(left<=right){  
            if(left==right)  
                return left;  
            int mid=(left+right)/2;  
            if(num[mid]<num[mid+1])  
                left=mid+1;  
            else  
                right=mid;  
        }  
        return -1;
    }
}
