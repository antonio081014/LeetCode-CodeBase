/**
 * https://leetcode.com/problems/implement-trie-prefix-tree/
 * 
 * 
 */ 
// Date: Thu May 14 09:51:11 PDT 2020
class Trie {
    
    class TrieNode {
        var isWord: Bool
        var children: [Character: TrieNode]
        
        init() {
            self.isWord = false
            self.children = [:]
        }
    }
    
    var root: TrieNode
    
    /** Initialize your data structure here. */
    init() {
        self.root = TrieNode()
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var node = self.root
        for c in word {
            node.children[c] = node.children[c, default: TrieNode()]
            node = node.children[c]!
        }
        node.isWord = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var node = self.root
        for c in word {
            if let cNode = node.children[c] {
                node = cNode
            } else {
                return false
            }
        }
        return node.isWord
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var node = self.root
        for c in prefix {
            if let cNode = node.children[c] {
                node = cNode
            } else {
                return false
            }
        }
        return true
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
