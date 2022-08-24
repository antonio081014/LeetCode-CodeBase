class Solution {
    
    private struct Role {
        let attack: Int
        let defense: Int
        
        init(_ att: Int, _ def: Int) {
            self.attack = att
            self.defense = def
        }
    }
    /// - Complexity:
    ///     - Time: O(nlogn), n == properties.count
    ///     - Space: O(n).
    func numberOfWeakCharacters(_ properties: [[Int]]) -> Int {
        let n = properties.count
        let roleList: [Role] = properties
            .map { Role($0[0], $0[1]) }
            .sorted { roleA, roleB in
                return roleA.attack == roleB.attack ? roleA.defense > roleB.defense : roleA.attack < roleB.attack
            }
        
        var result = 0
        var maxDefense = Int.min
        for index in stride(from: n - 1, through: 0, by: -1) {
            let role = roleList[index]
            if role.defense < maxDefense {
                result += 1
            }
            maxDefense = max(maxDefense, role.defense)
        }
        return result
    }
}
