/**
 * https://leetcode.com/problems/search-suggestions-system/
 * 
 * 
 */ 
// Date: Mon May 31 15:36:06 PDT 2021
class Trie {
    class TrieNode {
        var children: [Character : TrieNode]
        var words: [String]

        init() {
            self.children = [:]
            self.words = []
        }
    }
    
    let root = TrieNode()

    func insert(_ word: String) {
        var node = root
        for c in word {
            if let child = node.children[c] {
                child.words.append(word)
                node = child
            } else {
                let child = TrieNode()
                child.words.append(word)
                node.children[c] = child
                node = child
            }
        }
    }

}

class Solution {
    func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        var root = Trie()
        for prod in products {
            root.insert(prod)
        }
        var result = [[String]]()
        var node: Trie.TrieNode? = root.root
        for c in searchWord {
            if let child = node?.children[c] {
                result.append(Array(child.words.sorted().prefix(3)))
                node = child
            } else {
                result.append([])
                node = nil
            }
        }
        return result
    }
}