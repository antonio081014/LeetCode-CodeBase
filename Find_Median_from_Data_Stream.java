/**
 * Problem Link: https://leetcode.com/problems/find-median-from-data-stream/
 */
class MedianFinder {
    private List<Integer> sortedArray = new ArrayList<Integer>();

    // Adds a number into the data structure.
    public void addNum(int num) {
        int left = 0;
        int right = sortedArray.size();
        while(left < right) {
            int mid = (left + right) / 2;
            if(sortedArray.get(mid) <= num) left = mid + 1;
            else right = mid;
        }
        // if(sortedArray.get(left) > num) sortedArray.add(0, num);
        // else 
        sortedArray.add(left, num);
    }

    // Returns the median of current data stream
    public double findMedian() {
        if(sortedArray.size() == 0) return 0.0;
        int mid = sortedArray.size() / 2;
        if(sortedArray.size() % 2 == 1) {
            return sortedArray.get(mid);
        } else {
            return .5 * (sortedArray.get(mid) + sortedArray.get(mid - 1));
        }
    }
};

// Your MedianFinder object will be instantiated and called as such:
// MedianFinder mf = new MedianFinder();
// mf.addNum(1);
// mf.findMedian();
