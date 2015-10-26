/**
 * Problem Link: https://leetcode.com/problems/add-and-search-word-data-structure-design/
 */
public class WordDictionary {
    private Trie tree = new Trie();
    // Adds a word into the data structure.
    public void addWord(String word) {
        tree.addWord(word);
    }

    // Returns if the word is in the data structure. A word could
    // contain the dot character '.' to represent any one letter.
    public boolean search(String word) {
        return tree.searchWord(word);
    }
}
class TrieNode {
    public char text;
    TrieNode[] child;
    public boolean isWord;
    
    public TrieNode(char c) {
        text = c;
        child = new TrieNode[26];
        isWord = false;
    }
}

class Trie {
    public TrieNode root;
    
    public Trie(){
        root = new TrieNode(' ');
    }
    
    public void addWord(String word) {
        TrieNode node = root;
        for(int i=0; i<word.length(); i++){
            int a = word.charAt(i) - 'a';
            if(node.child[a] == null) {
                node.child[a] = new TrieNode(word.charAt(i));
            }
            node = node.child[a];
        }
        node.isWord = true;
    }
    
    public boolean searchWord(String word) {
        TrieNode node = root;
        return searchWord(root, word);
    }
    
    private boolean searchWord(TrieNode node, String s) {
        if(node == null) return false;
        if(s.length() == 1) {
            if(s.charAt(0) == '.') {
                for(int i=0; i<node.child.length; i++) {
                    if(node.child[i] != null && node.child[i].isWord) return true;
                }
                return false;
            } else {
                int c = s.charAt(0) - 'a';
                return node.child[c] != null && node.child[c].isWord;
            }
        }
        char c = s.charAt(0);
        if(c != '.') {
            return searchWord(node.child[c-'a'], s.substring(1));
        }
        for(int i=0; i<node.child.length; i++) {
            if(node.child[i] != null && searchWord(node.child[i], s.substring(1))) return true;
        }
        return false;
     }
}

// Your WordDictionary object will be instantiated and called as such:
// WordDictionary wordDictionary = new WordDictionary();
// wordDictionary.addWord("word");
// wordDictionary.search("pattern");
