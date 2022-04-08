//
//  TwitterAPIUserTimelinePayload.swift
//  TwitterCloneSaga
//
//  Created by Alfredo Colon on 4/8/22.
//

import Foundation

public class TwitterAPIUserTimelinePayload: NSObject, DataSerializiingProtocol {
    var oldest_id: String?
    var newest_id: String?
    var result_count: Int?
    var next_token: String?
    
    // MARK: - Serialization
    
    typealias Keys = CodingKeys
    
    enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
        case oldest_id
        case newest_id
        case result_count
        case next_token
        
        var valueType: TwitterAPIPayloadValue {
            switch self {
            case .oldest_id:
                return .data(.string, inArray: false)
            case .newest_id:
                return .data(.string, inArray: false)
            case .result_count:
                return .data(.int, inArray: false)
            case .next_token:
                return .data(.string, inArray: false)
            }
        }
    }
    
    required public init(from decoder: Decoder) throws {
        super.init()
        self.json(decode: decoder)
    }

    public func encode(to encoder: Encoder) throws {
        self.json(encode: encoder)
    }

    public static var supportsSecureCoding: Bool { return true }

    public func encode(with coder: NSCoder) {
        self.transformable(encode: coder)
    }

    required public init?(coder: NSCoder) {
        super.init()
        self.transformable(decode: coder)
    }

    func getValue(forKey key: CodingKeys) -> Any? {
        switch key {
        case .oldest_id:
            return self.oldest_id
        case .newest_id:
            return self.newest_id
        case .result_count:
            return self.result_count
        case .next_token:
            return self.next_token
        }
    }

    func setValue(forKey key: CodingKeys, value: Any?) {
        switch key {
        case .oldest_id:
            self.oldest_id = value as? String
        case .newest_id:
            self.newest_id = value as? String
        case .result_count:
            self.result_count = value as? Int
        case .next_token:
            self.next_token = value as? String
        }
    }
}
