/**
* Problem: https://leetcode.com/problems/count-primes/
*/
public class Solution {
    public int countPrimes(int n) {
        int count = 0;
        for(int i=1; i<n; i++) {
            if(isPrime(i)) count++;
        }
        return count;
    }
    
    /**
    * Check if the parameter n (positive number) is a prime number.
    */
    private boolean isPrime(int n){
        if(n==1) return false;
        if(n!=2 && n%2 == 0) return false;
        for(int i=3; i*i<=n; i+=2) {
            if(n%i ==0) return false;
        }
        return true;
    }
}
