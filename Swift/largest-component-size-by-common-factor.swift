/**
 * https://leetcode.com/problems/largest-component-size-by-common-factor/
 * 
 * 
 */ 
// Date: Sun Aug 30 14:11:01 PDT 2020
/// Permutation with DFS will NOT work, TLE.
class Solution {
    func largestComponentSize(_ A: [Int]) -> Int {
        var map: [Int : [Int]] = [:]
        for i in 0 ..< A.count - 1 {
            for j in i + 1 ..< A.count {
                if gcd(A[i], A[j]) > 1 {
                    var m1 = map[A[i], default: [Int]()]
                    m1.append(A[j])
                    map[A[i]] = m1

                    var m2 = map[A[j], default: [Int]()]
                    m2.append(A[i])
                    map[A[j]] = m2
                }
            }
        }

        print("\(map)")

        var maxLen = 0

        func dfs(from start: Int, _ visited: inout Set<Int>) {
            if visited.count > maxLen {
                maxLen = visited.count
            }
            let candidate = map[start, default: [Int]()]
            for next in candidate {
                if visited.contains(next) == false {
                    visited.insert(next)
                    dfs(from: next, &visited)
                    visited.remove(next)
                }
            }
        }

        for start in A {
            var visited: Set<Int> = [start]
            dfs(from: start, &visited)
        }

        return maxLen
    }

    private func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 { return a }
        return gcd(b, a % b)
    }
}/**
 * https://leetcode.com/problems/largest-component-size-by-common-factor/
 * 
 * 
 */ 
// Date: Sun Aug 30 23:25:33 PDT 2020
// MARK: Union Find 

public class UnionFind {
	
	// MARK: Properties 

	public private(set) var parent: [Int]
	public private(set) var size: [Int]


	// MARK: Initialization 
	
	/// Initializes Union Find with n objects 
	public init(_ n: Int) {
		self.parent = Array(0 ..< n) 
		self.size = Array(repeating: 1, count: n) 
	}


	// MARK: Methods 

	/// Connects the set containing p with the set containing q
	public func union(_ p: Int, _ q: Int) {
		let pid = findParent(p) 
		let qid = findParent(q) 
        guard pid != qid else { return }
		let (small, big) = size[pid] < size[qid] ? 
			(pid, qid) : (qid, pid) 
		size[big] += size[small]
		parent[small] = big 
	}

	/// Returns true if and only if p and q are connected 
	public func find(_ p: Int, _ q: Int) -> Bool {
		let pid = findParent(p)
		let qid = findParent(q)
		return pid == qid 
	}

	/// Returns the root of r and performs path compression 
	public func root(_ r: Int) -> Int {
		var r = r 
		while parent[r] != r {
			parent[r] = parent[parent[r]]
			r = parent[r]
		}
		return r 
	}
    
    public func findParent(_ r: Int) -> Int {
        var r = r 
        while parent[r] != r {
            r = parent[r]
        }
        return r 
    }
}

class Solution {
    func largestComponentSize(_ A: [Int]) -> Int {
        var uf = UnionFind((A.max() ?? 0) + 1)
        var map = [Int: Int]()

        for num in A {
            let primes = getPrimes(num)
            map[num] = primes[0]
            print("\(num) : \(primes)")
            for i in 0 ..< primes.count - 1 {
                uf.union(primes[i], primes[i+1])
            }
        }
         
        var count = [Int: Int]()
        for num in A {
            var parent = uf.findParent(map[num]!)
            count[parent, default: 0] += 1
        }
        
        return count.values.max() ?? 0
    }

    private func getPrimes(_ n: Int) -> [Int] {
        var primes: Set<Int> = []
        var n = n
        var factor = 2
        while factor * factor <= n {
            if n % factor == 0 {
                primes.insert(factor)
                n /= factor
            } else {
                factor += 1
            }
        }
        primes.insert(n)
        return Array(primes)
    }
}