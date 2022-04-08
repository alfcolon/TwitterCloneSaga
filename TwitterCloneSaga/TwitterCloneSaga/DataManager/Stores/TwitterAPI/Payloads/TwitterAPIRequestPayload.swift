//
//  TwitterAPIRequestPayload.swift
//  TwitterCloneSaga
//
//  Created by Alfredo Colon on 4/8/22.
//

import Foundation

struct TwitterAPIRequestPayload<T: Codable>: Codable {
    var data: [T]?
    var error: TwitterAPIErrorPayload?
    var includes: TwitterAPIExpandedObjectsPayload?
    
    // MARK: - Serialization
    
    enum CodingKeys: CodingKey, CaseIterable {
        case data
        case error
        case includes
    }
    
    init(from decoder: Decoder) throws {
        guard let container = try? decoder.container(keyedBy: CodingKeys.self) else { fatalError() }
        
        for codingKey in CodingKeys.allCases {
            switch codingKey {
            case .data:
                self.data = try? container.decode([T].self, forKey: .data)
            case .error:
                self.error = try? container.decode(TwitterAPIErrorPayload.self, forKey: .error)
            case .includes:
                self.includes = try? container.decode(TwitterAPIExpandedObjectsPayload.self, forKey: .includes)
            }
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        for codingKey in CodingKeys.allCases {
            switch codingKey {
            case .data:
                try? container.encode(self.data, forKey: .data)
            case .error:
                try? container.encode(self.error, forKey: .error)
            case .includes:
                try? container.encode(self.includes, forKey: .includes)
            }
        }
    }
}
