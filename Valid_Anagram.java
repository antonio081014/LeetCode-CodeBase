/**
 * Problem: https://leetcode.com/problems/valid-anagram/
 */
public class Solution {
    public boolean isAnagram(String s, String t) {
        return sortedString(s).compareTo(sortedString(t)) == 0;
    }
    
    private String sortedString(String s) {
        char[] array = s.toCharArray();
        Arrays.sort(array);
        return new String(array);
    }
}
