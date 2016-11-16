import Foundation

struct Problem: CustomDebugStringConvertible {
	let seq: Int
	let question: String

	var debugDescription: String {
		return "\(seq) \(question)"
    }
}
print("|   |   |   |   |   |")
print("|---|---|---|---|---|")

while let s1 = readLine(), let s2 = readLine() {
	let seq = Int(s1.trimmingCharacters(in: .whitespacesAndNewlines))!
	let array = s2.components(separatedBy: "\t")
	let problem = Problem(seq: seq, question: array[0].trimmingCharacters(in: .whitespacesAndNewlines))
	// print("\(problem) [swift]()")
	print("| [ ] | \(problem.seq) | \(problem.question) | [Swift](https://www.google.com) | [Java](https://www.google.com) | ")
}