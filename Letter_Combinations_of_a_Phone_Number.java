/**
 * Problem Link: https://leetcode.com/problems/letter-combinations-of-a-phone-number/
 * 
 * Iterate all of the possible solutions.
 */

public class Solution {
    private HashMap<Integer, String> map;
    private List<String> list;
    public List<String> letterCombinations(String digits) {
        map = new HashMap<Integer, String>();
        map.put(0, "");
        map.put(1, "");
        map.put(2, "abc");
        map.put(3, "def");
        map.put(4, "ghi");
        map.put(5, "jkl");
        map.put(6, "mno");
        map.put(7, "pqrs");
        map.put(8, "tuv");
        map.put(9, "wxyz");
        list = new ArrayList<String>();
        combine(digits, 0, "");
        return list;
    }
    
    private void combine(String digit, int current, String ret) {
        if(current == digit.length()) {
            if(ret.length() > 0) list.add(ret);
            return;
        }
        String s = map.get(digit.charAt(current) - '0');
        for(int i=0; i<s.length(); i++) {
            char c = s.charAt(i);
            combine(digit, current + 1, ret + c);
        }
    }
}
