/**
 * https://leetcode.com/problems/stream-of-characters/
 * 
 * 
 */ 
// Date: Sun Aug 23 11:04:17 PDT 2020
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

class StreamChecker {

    let trie: Trie
    var list: [Character]
    init(_ words: [String]) {
        self.trie = Trie()
        for w in words {
            self.trie.insert(String(w.reversed()))
        }
        self.list = []
    }
    
    func query(_ letter: Character) -> Bool {
        self.list.append(letter)
        var node = self.trie.root
        for index in stride(from: self.list.count - 1, through: 0, by: -1) {
            if let next = node.children[self.list[index]] {
                if next.isWord { return true }
                node = next
            } else {
                return false
            }
        }
        return false
    }
}

/**
 * Your StreamChecker object will be instantiated and called as such:
 * let obj = StreamChecker(words)
 * let ret_1: Bool = obj.query(letter)
["StreamChecker","query","query","query","query","query","query","query","query","query","query","query","query","query"]
[[["cd","f","kl","k", "l"]],["a"],["b"],["c"],["d"],["e"],["f"],["g"],["h"],["i"],["j"],["k"],["f"],["l"]]
 */