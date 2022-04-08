//
//  TwitterAPIExpandedObjectsPayload.swift
//  TwitterCloneSaga
//
//  Created by Alfredo Colon on 4/8/22.
//

import Foundation

public class TwitterAPIExpandedObjectsPayload: NSObject, DataSerializiingProtocol {
    var list: [TwitterAPIListPayload]?
    var media: [TwitterAPIMediaPayload]?
    var place: [TwitterAPIPlacePayload]?
    var poll: [TwitterAPIPollPayload]?
    var space: [TwitterAPISpacePayload]?
    var tweets: [TwitterAPITweetPayload]?
    var users: [TwitterAPIUserPayload]?

    // MARK: - Serialization
    
    typealias Keys = CodingKeys
    
    enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
        case list
        case media
        case places
        case poll
        case space
        case tweets
        case users
        
        var valueType: TwitterAPIPayloadValue {
            switch self {
            case .list:
                return .object(.media, inArray: true)
            case .media:
                return .object(.media, inArray: true)
            case .places:
                return .object(.place, inArray: true)
            case .poll:
                return .object(.tweet, inArray: true)
            case .space:
                return .object(.tweet, inArray: true)
            case .tweets:
                return .object(.tweet, inArray: true)
            case .users:
                return .object(.user, inArray: true)
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
        case .media:
            return self.media
        case .places:
            return self.place
        case .tweets:
            return self.tweets
        case .users:
            return self.users
        case .list:
            return self.list
        case .poll:
            return self.poll
        case .space:
            return self.space
        }
    }

    func setValue(forKey key: CodingKeys, value: Any?) {
        switch key {
        case .media:
            self.media = value as? [TwitterAPIMediaPayload]
        case .places:
            self.place = value as? [TwitterAPIPlacePayload]
        case .tweets:
            self.tweets = value as? [TwitterAPITweetPayload]
        case .users:
            self.users = value as? [TwitterAPIUserPayload]
        case .list:
            self.list = value as? [TwitterAPIListPayload]
        case .poll:
            self.poll = value as? [TwitterAPIPollPayload]
        case .space:
            self.space = value as? [TwitterAPISpacePayload]
        }
    }
}
