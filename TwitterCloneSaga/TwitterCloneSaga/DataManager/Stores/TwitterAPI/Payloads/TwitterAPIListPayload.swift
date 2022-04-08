//
//  TwitterAPIListPayload.swift
//  TwitterCloneSaga
//
//  Created by Alfredo Colon on 4/8/22.
//

import Foundation

public class TwitterAPIListPayload: NSObject, DataSerializiingProtocol {
    
    var name: String?
    var member_count: Int?
    var id: String?
    var _private: Bool?
    var _description: String?
    var follower_count: Int?
    var owner_id: String?
    var created_at: Date?
    

    // MARK: - Serialization
    
    typealias Keys = CodingKeys
    
    enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
        case name
        case member_count
        case id
        case _private = "private"
        case _description = "description"
        case follower_count
        case owner_id
        case created_at
        
        var valueType: TwitterAPIPayloadValue {
            switch self {
            case  .name:
                return .data(.string, inArray: false)//var id: String?
            case  .member_count:
                return .data(.int, inArray: false)//var participant_count: Int?
            case  .id:
                return .data(.string, inArray: false)//var state: String?
            case  ._private:
                return .data(.bool, inArray: false)//var is_ticketed: Bool?
            case  ._description:
                return .data(.string, inArray: false)//var state: String?
            case  .follower_count:
                return .data(.int, inArray: false)//var participant_count: Int?
            case  .owner_id:
                return .data(.string, inArray: false)//var state: String?
            case  .created_at:
                return .data(.date, inArray: false)//var state: Date?
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
        case  .name:
            return self.name
        case  .member_count:
            return self.member_count
        case  .id:
            return self.id
        case  ._private:
            return self._private
        case  ._description:
            return self._description
        case  .follower_count:
            return self.follower_count
        case  .owner_id:
            return self.owner_id
        case  .created_at:
            return self.created_at
        }
    }

    func setValue(forKey key: CodingKeys, value: Any?) {
        switch key {
        case  .name:
            self.name = value as? String
        case  .member_count:
            self.member_count = value as? Int
        case  .id:
            self.id = value as? String
        case  ._private:
            self._private = value as? Bool
        case  ._description:
            self._description = value as? String
        case  .follower_count:
            self.follower_count = value as? Int
        case  .owner_id:
            self.owner_id = value as? String
        case  .created_at:
            self.created_at = value as? Date
        }
    }
}
