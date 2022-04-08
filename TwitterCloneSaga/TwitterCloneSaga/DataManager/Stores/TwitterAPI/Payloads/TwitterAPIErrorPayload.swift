//
//  TwitterAPIErrorPayload.swift
//  TwitterCloneSaga
//
//  Created by Alfredo Colon on 4/8/22.
//

import Foundation

public class TwitterAPIErrorPayload: NSObject, DataSerializiingProtocol {
    var detail: String?
    var parameter: String?
    var resource_id: String?
    var resource_type: String?
    var section: String?
    var title: String?
    var type: String?
    var value: String?
    
    // MARK: - Serialization
    
    typealias Keys = CodingKeys
    
    enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
        case resource_id
        case parameter
        case resource_type
        case section
        case title
        case value
        case detail
        case type
        
        var valueType: TwitterAPIPayloadValue {
            switch self {
            case .resource_id:
                return .data(.string, inArray: false)
            case .parameter:
                return .data(.string, inArray: false)
            case .resource_type:
                return .data(.string, inArray: false)
            case .section:
                return .data(.string, inArray: false)
            case .title:
                return .data(.string, inArray: false)
            case .value:
                return .data(.string, inArray: false)
            case .detail:
                return .data(.string, inArray: false)
            case .type:
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
        case .detail:
            return self.detail
        case .parameter:
            return self.parameter
        case .resource_id:
            return self.resource_id
        case .resource_type:
            return self.resource_type
        case .section:
            return self.section
        case .title:
            return self.title
        case .type:
            return self.type
        case .value:
            return self.value
        }
    }
    
    func setValue(forKey key: CodingKeys, value: Any?) {
        switch key {
        case .detail:
            self.detail = value as? String
        case .parameter:
            self.detail = value as? String
        case .resource_id:
            self.detail = value as? String
        case .resource_type:
            self.detail = value as? String
        case .section:
            self.detail = value as? String
        case .title:
            self.detail = value as? String
        case .type:
            self.detail = value as? String
        case .value:
            self.detail = value as? String
        }
    }
}
