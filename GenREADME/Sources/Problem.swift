//
//  File.swift
//  GenREADME
//
//  Created by Antonio081014 on 2025-03-23.
//

import Foundation

struct Problem: CustomDebugStringConvertible {
    let seq: Int
    let qTitle: String
    let qSlug: String
    
    var debugDescription: String {
        return "\(seq) \(qSlug)"
    }
}

extension Problem: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(seq)
    }
    
    static func == (lhs: Problem, rhs: Problem) -> Bool {
        return lhs.seq == rhs.seq
    }
}

extension Problem {
    init?(json: [String: Any]) {
        guard let seq = json["frontend_question_id"] as? Int,
            let qTitle = json["question__title"] as? String,
            let qSlug = json["question__title_slug"]  as? String
            else {
                return nil
        }
        self.seq = seq
        self.qTitle = qTitle
        self.qSlug = qSlug
    }
}
