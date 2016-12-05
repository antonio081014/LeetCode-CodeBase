public class Solution {
    public boolean isPowerOfTwo(int n) {
        if(n == 0) return false;
        int base = (int)(Math.log(1.0 * n) / Math.log(2.0));
        return n == (int)Math.pow(2.0, base);
    }
}
