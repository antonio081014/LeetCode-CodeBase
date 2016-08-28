public class Solution {
    public double findMedianSortedArrays(int[] nums1, int[] nums2) {
        int m = nums1.length; 
        int n = nums2.length;
        if ((m + n) % 2 != 0) return findKthSmallest(nums1, nums2, (m+n)/2, 0, m-1, 0, n-1);
        else return 0.5 * (findKthSmallest(nums1, nums2, (m+n)/2, 0, m-1, 0, n-1) + findKthSmallest(nums1, nums2, (m+n)/2 - 1, 0, m-1, 0, n-1));
    }
    
    int findKthSmallest(int A[], int B[], int k, int aStart, int aEnd, int bStart, int bEnd) {
	    int aLen = aEnd - aStart + 1;
	    int bLen = bEnd - bStart + 1;
 
    	// Handle special cases
    	if (aLen == 0)
    		return B[bStart + k];
    	if (bLen == 0)
    		return A[aStart + k];
    	if (k == 0)
    		return A[aStart] < B[bStart] ? A[aStart] : B[bStart];
    	
    	int aMid = aLen * k / (aLen + bLen); // a's middle count
    	int bMid = k - aMid - 1; // b's middle count
     
    	// make aMid and bMid to be array index
    	aMid = aMid + aStart;
    	bMid = bMid + bStart;
    	
    	if (A[aMid] > B[bMid]) {
    	    return findKthSmallest(A, B, k - (bMid - bStart + 1), aStart, aMid, bMid + 1, bEnd);
    	} else {
    	    return findKthSmallest(A, B, k - (aMid - aStart + 1), aMid + 1, aEnd, bStart, bMid);
    	}
	}
}
