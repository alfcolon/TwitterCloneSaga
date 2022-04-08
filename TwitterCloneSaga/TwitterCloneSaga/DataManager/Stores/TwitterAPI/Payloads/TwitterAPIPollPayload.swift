//
//  TwitterAPIPollPayload.swift
//  TwitterCloneSaga
//
//  Created by Alfredo Colon on 4/8/22.
//

import Foundation

public class TwitterAPIPollPayload: NSObject, DataSerializiingProtocol {

    var id: String?
    var state: String?
    var created_at: Date?
    var host_ids: [String]?
    var lang: String?
    var is_ticketed: Bool?
    var invited_user_ids: [String]?
    var participant_count: Int?
    var scheduled_start: Date?
    var speaker_ids: [String]?
    var started_at: Date?
    var title: String?
    var updated_at: Date?

    // MARK: - Serialization
    
    typealias Keys = CodingKeys
    
    enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
        case id
        case state
        case created_at
        case host_ids
        case lang
        case is_ticketed
        case invited_user_ids
        case participant_count
        case scheduled_start
        case speaker_ids
        case started_at
        case title
        case updated_at
        
        var valueType: TwitterAPIPayloadValue {
            switch self {
            case .id:
                return .data(.string, inArray: false)//var id: String?
            case .state:
                return .data(.string, inArray: false)//var state: String?
            case .created_at:
                return .data(.date, inArray: false)//var created_at: Date?
            case .host_ids:
                return .data(.string, inArray: true)//var host_ids: [String]?
            case .lang:
                return .data(.string, inArray: false)//var lang: String?
            case .is_ticketed:
                return .data(.bool, inArray: false)//var is_ticketed: Bool?
            case .invited_user_ids:
                return .data(.string, inArray: true)//var invited_user_ids: [String]?
            case .participant_count:
                return .data(.int, inArray: false)//var participant_count: Int?
            case .scheduled_start:
                return .data(.date, inArray: false)//var scheduled_start: Date?
            case .speaker_ids:
                return .data(.string, inArray: true)//var speaker_ids: [String]?
            case .started_at:
                return .data(.date, inArray: false)//var started_at: Date?
            case .title:
                return .data(.string, inArray: false)//var title: String?
            case .updated_at:
                return .data(.date, inArray: false)//var updated_at: Date?
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
        case .id:
            return self.id
        case .state:
            return self.state
        case .created_at:
            return self.created_at
        case .host_ids:
            return self.host_ids
        case .lang:
            return self.lang
        case .is_ticketed:
            return self.is_ticketed
        case .invited_user_ids:
            return self.invited_user_ids
        case .participant_count:
            return self.participant_count
        case .scheduled_start:
            return self.scheduled_start
        case .speaker_ids:
            return self.speaker_ids
        case .started_at:
            return self.started_at
        case .title:
            return self.title
        case .updated_at:
            return self.updated_at
        }
    }

    func setValue(forKey key: CodingKeys, value: Any?) {
        switch key {
        case .id:
            self.id = value as? String
        case .state:
            self.state = value as? String
        case .created_at:
            self.created_at = value as? Date
        case .host_ids:
            self.host_ids = value as? [String]
        case .lang:
            self.lang = value as? String
        case .is_ticketed:
            self.is_ticketed = value as? Bool
        case .invited_user_ids:
            self.invited_user_ids = value as? [String]
        case .participant_count:
            self.participant_count = value as? Int
        case .scheduled_start:
            self.scheduled_start = value as? Date
        case .speaker_ids:
            self.speaker_ids = value as? [String]
        case .started_at:
            self.started_at = value as? Date
        case .title:
            self.title = value as? String
        case .updated_at:
            self.updated_at = value as? Date
        }
    }
}
