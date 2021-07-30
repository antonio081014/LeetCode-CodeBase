/**
 * https://leetcode.com/problems/map-sum-pairs/
 * 
 * 
 */ 
// Date: Fri Jul 30 16:44:14 PDT 2021
struct Trie {
    class TrieNode {
        var sum: Int = 0
        var children: [Character : TrieNode] = [:]
    }

    let root: TrieNode = TrieNode()
    var dict: [String : Int] = [:]
    mutating func insert(_ key: String, _ val: Int) {
        let diff = val - dict[key, default: 0]
        self.dict[key] = val
        var node = root
        for c in key {
            if let child = node.children[c] {
                child.sum += diff
                node = child
            } else {
                let child = TrieNode()
                node.children[c] = child
                child.sum += diff
                node = child
            }
        }
    }

    func fetch(_ prefix: String) -> Int? {
        var node = root
        for c in prefix {
            if let child = node.children[c] {
                node = child
            } else {
                return nil
            }
        }
        return node.sum
    }
}
class MapSum {

    /** Initialize your data structure here. */
    private var trie: Trie
    init() {
        self.trie = Trie()
    }

    func insert(_ key: String, _ val: Int) {
        self.trie.insert(key, val)
    }

    func sum(_ prefix: String) -> Int {
        return self.trie.fetch(prefix) ?? 0
    }
}

/**
 * Your MapSum object will be instantiated and called as such:
 * let obj = MapSum()
 * obj.insert(key, val)
 * let ret_2: Int = obj.sum(prefix)
 */

