/**
 * Problem Link: https://leetcode.com/problems/text-justification/
 * 
 * Really took me some time to cover every cases.
 */
public class Solution {
    public List<String> fullJustify(String[] words, int maxWidth) {
        List<String> list = new ArrayList<String>();
        int start = -1;
        int length = 0;
        for(int i=0; i<words.length; i++) {
            if(start == -1) {
                start = i;
                length = 0;
            }
            if(length + words[i].length() + (i - start) > maxWidth) {
                int count = i - start;
                int space = (maxWidth - length) / (count == 1 ? 1 : count - 1);
                int mod = (maxWidth - length) % (count == 1 ? 1 : count - 1);
                int total = maxWidth - words[start].length();
                String ret = words[start++];
                String spaceS = "";
                while(space-->0) spaceS+=" ";

                for(;start < i; start++) {
                    ret += (mod > 0 ? " " : "") + spaceS + words[start];
                    total -= words[start].length() + spaceS.length();
                    if(mod > 0) total --;
                    mod --;
                }
                if(total > 0) {
                    for(int k=0; k<total; k++)
                        ret += " ";
                }
                start = -1;
                list.add(ret);
                i--;
            } else {
                length += words[i].length();
                if(i == words.length - 1) {
                    int count = i - start + 1;
                    int space = maxWidth - words[start].length();
                    String ret = words[start++];
                    
                    for(;start < words.length; start++) {
                        ret += " " + words[start];
                        space -= words[start].length() + 1;
                    }
                    
                    if(space > 0) {
                        for(int k=0; k<space; k++)
                            ret += " ";
                    }
                    start = -1;
                    list.add(ret);
                }
            }
        }
        return list;
    }
}
