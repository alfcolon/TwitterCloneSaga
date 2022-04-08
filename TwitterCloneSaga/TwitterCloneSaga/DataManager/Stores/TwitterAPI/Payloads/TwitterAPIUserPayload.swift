//
//  TwitterAPIUserPayload.swift
//  TwitterCloneSaga
//
//  Created by Alfredo Colon on 4/8/22.
//

import Foundation

@objc public class TwitterAPIUserPayload: NSObject, DataSerializiingProtocol {
    @objc(User_Entities) class Entities: NSObject, DataSerializiingProtocol {
        @objc(User_entities_description) class Description: NSObject, DataSerializiingProtocol {
            @objc(User_entities_cashtag) class Cashtag: NSObject, DataSerializiingProtocol {
                var cashtag: String?
                var end: Int?
                var start: Int?

                // MARK: - Serialization
                
                typealias Keys = CodingKeys
                
                enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
                    case cashtag
                    case end
                    case start
                    
                    var valueType: TwitterAPIPayloadValue {
                        switch self {
                        case .cashtag:
                            return .data(.string, inArray: false)
                        case .end:
                            return .data(.int, inArray: false)
                        case .start:
                            return .data(.int, inArray: false)
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
                    case .end:
                        return self.end
                    case .cashtag:
                        return self.cashtag
                    case .start:
                        return self.start
                    }
                }

                func setValue(forKey key: CodingKeys, value: Any?) {
                    switch key {
                    case .end:
                        self.end = value as? Int
                    case .cashtag:
                        self.cashtag = value as? String
                    case .start:
                        self.start = value as? Int
                    }
                }
            }
            @objc(User_entities_hashtag) class Hashtag: NSObject, DataSerializiingProtocol {
                var end: Int?
                var hashtag: String?
                var start: Int?

                // MARK: - Serialization
                
                typealias Keys = CodingKeys
                
                enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
                    case hashtag
                    case end
                    case start
                    
                    var valueType: TwitterAPIPayloadValue {
                        switch self {
                        case .hashtag:
                            return .data(.int, inArray: false)
                        case .end:
                            return .data(.string, inArray: false)
                        case .start:
                            return .data(.int, inArray: false)
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
                    case .end:
                        return self.end
                    case .hashtag:
                        return self.hashtag
                    case .start:
                        return self.start
                    }
                }

                func setValue(forKey key: CodingKeys, value: Any?) {
                    switch key {
                    case .end:
                        self.end = value as? Int
                    case .hashtag:
                        self.hashtag = value as? String
                    case .start:
                        self.start = value as? Int
                    }
                }
            }
            @objc(User_entities_mention) class Mention: NSObject, DataSerializiingProtocol {
                var end: Int?
                var start: Int?
                var username: String?
                
                // MARK: - Serialization
                
                typealias Keys = CodingKeys
                
                enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
                    case username
                    case end
                    case start
                    
                    var valueType: TwitterAPIPayloadValue {
                        switch self {
                        case .username:
                            return .data(.int, inArray: false)
                        case .end:
                            return .data(.int, inArray: false)
                        case .start:
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
                    case .username:
                        return self.username
                    case .end:
                        return self.end
                    case .start:
                        return self.start
                    }
                }

                func setValue(forKey key: CodingKeys, value: Any?) {
                    switch key {
                    case .username:
                        self.username = value as? String
                    case .end:
                        self.end = value as? Int
                    case .start:
                        self.start = value as? Int
                    }
                }
            }
            @objc(User_entities_url) class URL: NSObject, DataSerializiingProtocol {
                var display_url: String?
                var end: Int?
                var expanded_url: String?
                var start: Int?
                var url: String?

                // MARK: - Serialization
                
                typealias Keys = CodingKeys
                
                enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
                    case display_url
                    case end
                    case expanded_url
                    case start
                    case url
                    
                    var valueType: TwitterAPIPayloadValue {
                        switch self {
                        case .display_url:
                            return .data(.string, inArray: false)
                        case .end:
                            return .data(.int, inArray: false)
                        case .expanded_url:
                            return .data(.string, inArray: false)
                        case .start:
                            return .data(.int, inArray: false)
                        case .url:
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
                    case .display_url:
                        return self.display_url
                    case .end:
                        return self.end
                    case .expanded_url:
                        return self.expanded_url
                    case .start:
                        return self.start
                    case .url:
                        return self.url
                    }
                }

                func setValue(forKey key: CodingKeys, value: Any?) {
                    switch key {
                    case .display_url:
                        self.display_url = value as? String
                    case .end:
                        self.end = value as? Int
                    case .expanded_url:
                        self.expanded_url = value as? String
                    case .start:
                        self.start = value as? Int
                    case .url:
                        self.url = value as? String
                    }
                }
            }

            var cashtags: [Cashtag]?
            var hashtags: [Hashtag]?
            var mentions: [Mention]?
            var urls: [URL]?

            // MARK: - Serialization
            
            typealias Keys = CodingKeys
            
            enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
                case cashtags
                case hashtags
                case mentions
                case urls
                
                var valueType: TwitterAPIPayloadValue {
                    switch self {
                    case .cashtags:
                        return .object(.user_entities_descripion_cashtag, inArray: true)
                    case .hashtags:
                        return .object(.user_entities_descripion_hashtag, inArray: true)
                    case .mentions:
                        return .object(.user_entities_descripion_mention, inArray: true)
                    case .urls:
                        return .object(.user_entities_url, inArray: true)
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
                case .cashtags:
                    return self.cashtags
                case .hashtags:
                    return self.hashtags
                case .mentions:
                    return self.mentions
                case .urls:
                    return self.urls
                }
            }

            func setValue(forKey key: CodingKeys, value: Any?) {
                switch key {
                case .cashtags:
                    self.cashtags = value as? [Cashtag]
                case .hashtags:
                    self.hashtags = value as? [Hashtag]
                case .mentions:
                    self.mentions = value as? [Mention]
                case .urls:
                    self.urls = value as? [URL]
                }
            }
        }
        @objc(User_url) class URL: NSObject, DataSerializiingProtocol {
            @objc(User_url_urls) class URLS: NSObject, DataSerializiingProtocol {
                var display_url: String?
                var end: Int?
                var expanded_url: String?
                var start: Int?
                var url: String?

                // MARK: - Serialization
                
                typealias Keys = CodingKeys
                
                enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
                    case display_url
                    case end
                    case expanded_url
                    case start
                    case url
                    
                    var valueType: TwitterAPIPayloadValue {
                        switch self {
                        case .display_url:
                            return .data(.string, inArray: false)
                        case .end:
                            return .data(.int, inArray: false)
                        case .expanded_url:
                            return .data(.string, inArray: false)
                        case .start:
                            return .data(.int, inArray: false)
                        case .url:
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
                    case .display_url:
                        return self.display_url
                    case .end:
                        return self.end
                    case .expanded_url:
                        return self.expanded_url
                    case .start:
                        return self.start
                    case .url:
                        return self.url
                    }
                }

                func setValue(forKey key: CodingKeys, value: Any?) {
                    switch key {
                    case .display_url:
                        self.display_url = value as? String
                    case .end:
                        self.end = value as? Int
                    case .expanded_url:
                        self.expanded_url = value as? String
                    case .start:
                        self.start = value as? Int
                    case .url:
                        self.url = value as? String
                    }
                }
            }

            var urls: [URLS]?
            
            // MARK: - Serialization
            
            typealias Keys = CodingKeys
            
            enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
                case urls
                
                var valueType: TwitterAPIPayloadValue {
                    switch self {
                    case .urls:
                        return .object(.user_entities_url_urls, inArray: true)
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
                case .urls:
                    return self.urls
                }
            }

            func setValue(forKey key: CodingKeys, value: Any?) {
                switch key {
                case .urls:
                    self.urls = value as? [URLS]
                }
            }
        }

        var _description: [Description]?
        var url: [URL]?
        
        // MARK: - Serialization
        
        typealias Keys = CodingKeys
        
        enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
            case description
            case url
            
            var valueType: TwitterAPIPayloadValue {
                switch self {
                case .description:
                    return .object(.user_entities_descripion, inArray: true)
                case .url:
                    return .object(.user_entities_descripion_url, inArray: true)
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
            case .description:
                return self._description
            case .url:
                return self.url
            }
        }

        func setValue(forKey key: CodingKeys, value: Any?) {
            switch key {
            case .description:
                self._description = value as? [Description]
            case .url:
                self.url = value as? [URL]
            }
        }
    }
    @objc(User_PublicMetrics) class PublicMetrics: NSObject, DataSerializiingProtocol {
        var followers_count: Int?
        var following_count: Int?
        var listed_count: Int?
        var tweet_count: Int?
        
        // MARK: - Serialization
        
        typealias Keys = CodingKeys
        
        enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
            case followers_count
            case following_count
            case listed_count
            case tweet_count
            
            var valueType: TwitterAPIPayloadValue {
                switch self {
                case .followers_count:
                    return .data(.int, inArray: false)
                case .following_count:
                    return .data(.int, inArray: false)
                case .listed_count:
                    return .data(.int, inArray: false)
                case .tweet_count:
                    return .data(.int, inArray: false)
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
            case .followers_count:
                return self.followers_count
            case .following_count:
                return self.following_count
            case .listed_count:
                return self.listed_count
            case .tweet_count:
                return self.tweet_count
            }
        }

        func setValue(forKey key: CodingKeys, value: Any?) {
            switch key {
            case .followers_count:
                self.followers_count = value as? Int
            case .following_count:
                self.following_count = value as? Int
            case .listed_count:
                self.listed_count = value as? Int
            case .tweet_count:
                self.tweet_count = value as? Int
            }
        }
    }
    @objc(User_Withheld) class WithHeld: NSObject, DataSerializiingProtocol {
        var country_codes: [String]?
        var scope: String?//   enum (tweet, user)

        // MARK: - Serialization
        
        typealias Keys = CodingKeys
        
        enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
            case country_codes
            case scope
            
            var valueType: TwitterAPIPayloadValue {
                switch self {
                case .country_codes:
                    return .object(.user_withheld, inArray: true)
                case .scope:
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
            case .country_codes:
                return self.country_codes
            case .scope:
                return self.scope
            }
        }

        func setValue(forKey key: CodingKeys, value: Any?) {
            switch key {
            case .country_codes:
                self.country_codes = value as? [String]
            case .scope:
                self.scope = value as? String
            }
        }
    }

    var created_at: Date?
    var _description: String?
    var entities: Entities?
    var id: String?
    var location: String?
    var name: String?
    var pinned_tweet_id: String?
    var profile_image_url: String?
    var protected: Bool?
    var public_metrics: PublicMetrics?
    var url: String?
    var username: String?
    var verified: Bool?
    var withheld: WithHeld?

    // MARK: - Serialization
    
    typealias Keys = CodingKeys
    
    enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
        case created_at
        case description
        case entities
        case id
        case location
        case name
        case pinned_tweet_id
        case profile_image_url
        case protected
        case public_metrics
        case url
        case username
        case verified
        case withheld
        
        var valueType: TwitterAPIPayloadValue {
            switch self {
            case .created_at:
                return .data(.date, inArray: false)
            case .description:
                return .data(.string, inArray: false)
            case .entities:
                return .object(.user_entities, inArray: false)
            case .id:
                return .data(.string, inArray: false)
            case .location:
                return .data(.string, inArray: false)
            case .name:
                return .data(.string, inArray: false)
            case .pinned_tweet_id:
                return .data(.string, inArray: false)
            case .profile_image_url:
                return .data(.string, inArray: false)
            case .protected:
                return .data(.bool, inArray: false)
            case .public_metrics:
                return .object(.user_publicmetrics, inArray: false)
            case .url:
                return .data(.string, inArray: false)
            case .username:
                return .data(.string, inArray: false)
            case .verified:
                return .data(.string, inArray: false)
            case .withheld:
                return .object(.user_withheld, inArray: false)
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
    
    // MARK: - Key access workaround

    func getValue(forKey key: CodingKeys) -> Any? {
        switch key {
        case .created_at:
            return self.created_at
        case .description:
            return self._description
        case .entities:
            return self.entities
        case .id:
            return self.id
        case .location:
            return self.location
        case .name:
            return self.name
        case .pinned_tweet_id:
            return self.pinned_tweet_id
        case .profile_image_url:
            return self.profile_image_url
        case .protected:
            return self.protected
        case .public_metrics:
            return self.public_metrics
        case .url:
            return self.url
        case .username:
            return self.username
        case .verified:
            return self.verified
        case .withheld:
            return self.withheld
        }
    }

    func setValue(forKey key: CodingKeys, value: Any?) {
        switch key {
        case .created_at:
            self.created_at = value as? Date
        case .description:
            self._description = value as? String
        case .entities:
            self.entities = value as? Entities
        case .id:
            self.id = value as? String
        case .location:
            self.location = value as? String
        case .name:
            self.name = value as? String
        case .pinned_tweet_id:
            self.pinned_tweet_id = value as? String
        case .profile_image_url:
            self.profile_image_url = value as? String
        case .protected:
            self.protected = value as? Bool
        case .public_metrics:
            self.public_metrics = value as? PublicMetrics
        case .url:
            self.url = value as? String
        case .username:
            self.username = value as? String
        case .verified:
            self.verified = value as? Bool
        case .withheld:
            self.withheld = value as? WithHeld
        }
    }
}
