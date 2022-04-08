//
//  TwitterAPITweetPayload.swift
//  TwitterCloneSaga
//
//  Created by Alfredo Colon on 4/8/22.
//

import Foundation

public class TwitterAPITweetPayload: NSObject, DataSerializiingProtocol {
    @objc(Tweet_Attachments)class Attachments: NSObject, DataSerializiingProtocol {
        
        var media_keys: [String]?
        
        override init() {
            super.init()
            TwitterAPITweetPayload.Attachments.objects = self
        }

        // MARK: - Serialization
        
        private static var objects: TwitterAPITweetPayload.Attachments!
        
        typealias Keys = CodingKeys
        
        enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
            case media_keys

            var valueType: TwitterAPIPayloadValue {
                switch self {
                case .media_keys:
                    return .data(.string, inArray: true)
                }
            }
            
            func set(value: Any?) {
                switch self {
                case .media_keys:
                    objects.media_keys = value as? [String]
                }
            }
            
            func getValue() -> Any? {
                switch self {
                case .media_keys:
                    return objects.media_keys
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
            case .media_keys:
                return self.media_keys
            }
        }
        
        func setValue(forKey key: CodingKeys, value: Any?) {
            switch key {
            case .media_keys:
                self.media_keys = value as? [String]
            }
        }

    }
    @objc(Tweet_ContextAnnotations)class ContextAnnotations: NSObject, DataSerializiingProtocol {
        @objc(Tweet_ContextAnnotations_Domain)class Domain: NSObject, DataSerializiingProtocol {
            var _description: String?
            var id: String?
            var name: String?
            
            // MARK: - Serialization
            
            typealias Keys = CodingKeys
            
            enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
                case description
                case id
                case name
                
                var valueType: TwitterAPIPayloadValue {
                    switch self {
                    case .description:
                        return .data(.string, inArray: false)
                    case .id:
                        return .data(.string, inArray: false)
                    case .name:
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
                case .description:
                    return self._description
                case .id:
                    return self.id
                case .name:
                    return self.name
                }
            }
            
            func setValue(forKey key: CodingKeys, value: Any?) {
                switch key {
                case .description:
                    self._description = value as? String
                case .id:
                    self.id = value as? String
                case .name:
                    self.name = value as? String
                }
            }
        }
        @objc(Tweet_ContextAnnotations_Entity)class Entity: NSObject, DataSerializiingProtocol {
            var id: String?
            var name: String?
            var _description: String?
            
            // MARK: - Serialization
            
            typealias Keys = CodingKeys

            enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
                case description
                case id
                case name
                
                var valueType: TwitterAPIPayloadValue {
                    switch self {
                    case .description:
                        return .data(.string, inArray: false)
                    case .id:
                        return .data(.string, inArray: false)
                    case .name:
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
                case .description:
                    return self._description
                case .id:
                    return self.id
                case .name:
                    return self.name
                }
            }

            func setValue(forKey key: CodingKeys, value: Any?) {
                switch key {
                case .description:
                    self._description = value as? String
                case .id:
                    self.id = value as? String
                case .name:
                    self.name = value as? String
                }
            }
        }

        var domain: Domain?
        var entity: Entity?
        
        // MARK: - Serialization
        
        typealias Keys = CodingKeys
        
        enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
            case domain
            case entity
            
            var valueType: TwitterAPIPayloadValue {
                switch self {
                case .domain:
                    return .object(.tweet_attachments_contextAnnotations_domain, inArray: false)
                case .entity:
                    return .object(.tweet_attachments_contextAnnotations_entity, inArray: false)
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
            case .domain:
                return self.domain
            case .entity:
                return self.entity
            }
        }

        func setValue(forKey key: CodingKeys, value: Any?) {
            switch key {
            case .domain:
                self.domain = value as? Domain
            case .entity:
                self.entity = value as? Entity
            }
        }
    }
    @objc(Tweet_Entities)class Entities: NSObject, DataSerializiingProtocol {
        @objc(Tweet_Entities_Annotation)class Annotation: NSObject, DataSerializiingProtocol {
            var start: Int?
            var end: Int?
            var probability: Float?
            var type: String?
            var normalized_text: String?
            
            // MARK: - Serialization
            
            typealias Keys = CodingKeys
            
            enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
                case start
                case end
                case probability
                case type
                case normalized_text
                
                var valueType: TwitterAPIPayloadValue {
                    switch self {
                    case .start:
                        return .data(.int, inArray: false)
                    case .end:
                        return .data(.int, inArray: false)
                    case .probability:
                        return .data(.float, inArray: false)
                    case .type:
                        return .data(.string, inArray: false)
                    case .normalized_text:
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
                case .start:
                    return self.start
                case .end:
                    return self.end
                case .probability:
                    return self.probability
                case .type:
                    return self.type
                case .normalized_text:
                    return self.normalized_text
                }
            }

            func setValue(forKey key: CodingKeys, value: Any?) {
                switch key {
                case .start:
                    self.start = value as? Int
                case .end:
                    self.end = value as? Int
                case .probability:
                    self.probability = value as? Float
                case .type:
                    self.type = value as? String
                case .normalized_text:
                    self.normalized_text = value as? String
                }
            }
        }
        @objc(Tweet_Entities_Cashtag)class Cashtag: NSObject, DataSerializiingProtocol {
            var end: Int?
            var start: Int?
            var tag: String?
            
            // MARK: - Serialization
            
            typealias Keys = CodingKeys
            
            enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
                case end
                case start
                case tag
                
                var valueType: TwitterAPIPayloadValue {
                    switch self {
                    case .end:
                        return .data(.int, inArray: false)
                    case .start:
                        return .data(.int, inArray: false)
                    case .tag:
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
                case .start:
                    return self.start
                case .end:
                    return self.end
                case .tag:
                    return self.tag
                }
            }

            func setValue(forKey key: CodingKeys, value: Any?) {
                switch key {
                case .start:
                    self.start = value as? Int
                case .end:
                    self.end = value as? Int
                case .tag:
                    self.tag = value as? String
                }
            }
        }
        @objc(Tweet_Entities_Hashtag)class Hashtag: NSObject, DataSerializiingProtocol {
            var end: Int?
            var start: Int?
            var tag: String?

            // MARK: - Serialization
            
            typealias Keys = CodingKeys
            
            enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
                case end
                case start
                case tag
                
                var valueType: TwitterAPIPayloadValue {
                    switch self {
                    case .end:
                        return .data(.int, inArray: false)
                    case .start:
                        return .data(.int, inArray: false)
                    case .tag:
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
                case .start:
                    return self.start
                case .end:
                    return self.end
                case .tag:
                    return self.tag
                }
            }

            func setValue(forKey key: CodingKeys, value: Any?) {
                switch key {
                case .start:
                    self.start = value as? Int
                case .end:
                    self.end = value as? Int
                case .tag:
                    self.tag = value as? String
                }
            }
        }
        @objc(Tweet_Entities_Mention)class Mention: NSObject, DataSerializiingProtocol {
            var start: Int?
            var end: Int?
            var username: String?
            var id: String?
 
            // MARK: - Serialization
            
            typealias Keys = CodingKeys
            
            enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
                case start
                case end
                case username
                case id
                
                var valueType: TwitterAPIPayloadValue {
                    switch self {
                    case .start:
                        return .data(.int, inArray: false)
                    case .end:
                        return .data(.int, inArray: false)
                    case .username:
                        return .data(.string, inArray: false)
                    case .id:
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
                case .start:
                    return self.start
                case .end:
                    return self.end
                case .username:
                    return self.username
                case .id:
                    return self.id
                }
            }

            func setValue(forKey key: CodingKeys, value: Any?) {
                switch key {
                case .start:
                    self.start = value as? Int
                case .end:
                    self.end = value as? Int
                case .username:
                    self.username = value as? String
                case .id:
                    self.id = value as? String
                }
            }
        }
        @objc(Tweet_Entities_URL)class URL: NSObject, DataSerializiingProtocol {
            @objc(Tweet_Entities_URL_Image)class Image: NSObject, DataSerializiingProtocol {
                var height: Int?
                var url: String?
                var width: Int?

                // MARK: - Serialization

                typealias Keys = CodingKeys

                enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
                    case height
                    case url
                    case width
                    
                    var valueType: TwitterAPIPayloadValue {
                        switch self {
                        case .height:
                            return .data(.int, inArray: false)
                        case .url:
                            return .data(.string, inArray: false)
                        case .width:
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
                    case .height:
                        return self.height
                    case .url:
                        return self.url
                    case .width:
                        return self.width
                    }
                }

                func setValue(forKey key: CodingKeys, value: Any?) {
                    switch key {
                    case .height:
                        self.height = value as? Int
                    case .url:
                        self.url = value as? String
                    case .width:
                        self.width = value as? Int
                    }
                }
            }

            var start: Int?
            var end: Int?
            var url: String?
            var expanded_url: String?
            var display_url: String?
            var unwound_url: String? // Needed?
            
            // MARK: - Serialization
            
            typealias Keys = CodingKeys
            
            enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
                case start
                case end
                case url
                case expanded_url
                case display_url
                case unwound_url
                
                var valueType: TwitterAPIPayloadValue {
                    switch self {
                    case .start:
                        return .data(.int, inArray: false)
                    case .end:
                        return .data(.int, inArray: false)
                    case .url:
                        return .data(.string, inArray: false)
                    case .expanded_url:
                        return .data(.string, inArray: false)
                    case .display_url:
                        return .data(.string, inArray: false)
                    case .unwound_url:
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
                case .start:
                    return self.start
                case .end:
                    return self.end
                case .url:
                    return self.url
                case .expanded_url:
                    return self.expanded_url
                case .display_url:
                    return self.display_url
                case .unwound_url:
                    return self.unwound_url
                }
            }

            func setValue(forKey key: CodingKeys, value: Any?) {
                switch key {
                case .start:
                    self.start = value as? Int
                case .end:
                    self.end = value as? Int
                case .url:
                    self.url = value as? String
                case .expanded_url:
                    self.expanded_url = value as? String
                case .display_url:
                    self.display_url = value as? String
                case .unwound_url:
                    self.unwound_url = value as? String
                }
            }
        }

        var annotations: [Annotation]?
        var cashtags: [Cashtag]?
        var hashtags: [Hashtag]?
        var mentions: [Mention]?
        var urls: [URL]?

        // MARK: - Serialization
        
        typealias Keys = CodingKeys
        
        enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
            case annotations
            case cashtags
            case hashtags
            case mentions
            case urls
            
            var valueType: TwitterAPIPayloadValue {
                switch self {
                case .annotations:
                    return .object(.tweet_entities_annotation, inArray: true)
                case .cashtags:
                    return .object(.tweet_entities_cashtag, inArray: true)
                case .hashtags:
                    return .object(.tweet_entities_hashtag, inArray: true)
                case .mentions:
                    return .object(.tweet_entities_mention, inArray: true)
                case .urls:
                    return .object(.tweet_entities_url, inArray: true)
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
            case .annotations:
                return self.annotations
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
            case .annotations:
                self.annotations = value as? [Annotation]
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
    @objc(Tweet_Geo)class Geo: NSObject, DataSerializiingProtocol {
        @objc(Tweet_Geo_Coordinate)class Coordinate: NSObject, DataSerializiingProtocol {
            var coordinates: [Float]?
            var type: String?
            
            // MARK: - Serialization
            
            typealias Keys = CodingKeys
            
            enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
                case coordinates
                case type
                
                var valueType: TwitterAPIPayloadValue {
                    switch self {
                    case .coordinates:
                        return .data(.float, inArray: true)
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
                case .coordinates:
                    return self.coordinates
                case .type:
                    return self.type
                }
            }

            func setValue(forKey key: CodingKeys, value: Any?) {
                switch key {
                case .coordinates:
                    self.coordinates = value as? [Float]
                case .type:
                    self.type = value as? String
                }
            }
        }

        var coordinates: Coordinate?
        var place_id: String?

        // MARK: - Serialization
        
        typealias Keys = CodingKeys
        
        enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
            case coordinates
            case place_id
            
            var valueType: TwitterAPIPayloadValue {
                switch self {
                case .coordinates:
                    return .object(.tweet_geo_coordinate, inArray: false)
                case .place_id:
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
            case .coordinates:
                return self.coordinates
            case .place_id:
                return self.place_id
            }
        }

        func setValue(forKey key: CodingKeys, value: Any?) {
            switch key {
            case .coordinates:
                self.coordinates = value as? Coordinate
            case .place_id:
                self.place_id = value as? String
            }
        }
    }
    @objc(Tweet_OrganicMetric)class OrganicMetric: NSObject, DataSerializiingProtocol {
        var impression_count: Int?
        var like_count: Int?
        var reply_count: Int?
        var retweet_count: Int?
        var url_link_clicks: Int?
        var user_profile_clicks: Int?
        
        // MARK: - Serialization
        
        typealias Keys = CodingKeys
        
        enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
            case impression_count
            case like_count
            case reply_count
            case retweet_count
            case url_link_clicks
            case user_profile_clicks
            
            var valueType: TwitterAPIPayloadValue {
                switch self {
                case .impression_count:
                    return .data(.int, inArray: false)
                case .like_count:
                    return .data(.int, inArray: false)
                case .reply_count:
                    return .data(.int, inArray: false)
                case .retweet_count:
                    return .data(.int, inArray: false)
                case .url_link_clicks:
                    return .data(.int, inArray: false)
                case .user_profile_clicks:
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
            case .impression_count:
                return self.impression_count
            case .like_count:
                return self.like_count
            case .reply_count:
                return self.reply_count
            case .retweet_count:
                return self.retweet_count
            case .url_link_clicks:
                return self.url_link_clicks
            case .user_profile_clicks:
                return self.user_profile_clicks
            }
        }

        func setValue(forKey key: CodingKeys, value: Any?) {
            switch key {
            case .impression_count:
                self.impression_count = value as? Int
            case .like_count:
                self.like_count = value as? Int
            case .reply_count:
                self.reply_count = value as? Int
            case .retweet_count:
                self.retweet_count = value as? Int
            case .url_link_clicks:
                self.url_link_clicks = value as? Int
            case .user_profile_clicks:
                self.user_profile_clicks = value as? Int
            }
        }
    }
    @objc(Tweet_NonPublicMetric)class NonPublicMetric: NSObject, DataSerializiingProtocol {
        var impression_count: Int?
        var url_link_clicks: Int?
        var user_profile_clicks: Int?
        
        // MARK: - Serialization
        
        typealias Keys = CodingKeys
        
        enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
            case impression_count
            case url_link_clicks
            case user_profile_clicks
            
            var valueType: TwitterAPIPayloadValue {
                switch self {
                case .impression_count:
                    return .data(.int, inArray: false)
                case .url_link_clicks:
                    return .data(.int, inArray: false)
                case .user_profile_clicks:
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
            case .impression_count:
                return self.impression_count
            case .url_link_clicks:
                return self.url_link_clicks
            case .user_profile_clicks:
                return self.user_profile_clicks
            }
        }

        func setValue(forKey key: CodingKeys, value: Any?) {
            switch key {
            case .impression_count:
                self.impression_count = value as? Int
            case .url_link_clicks:
                self.url_link_clicks = value as? Int
            case .user_profile_clicks:
                self.user_profile_clicks = value as? Int
            }
        }
   }
    @objc(Tweet_PromotedMetric)class PromotedMetric: NSObject, DataSerializiingProtocol {
        var impression_count: Int?
        var like_count: Int?
        var reply_count: Int?
        var retweet_count: Int?
        var url_link_clicks: Int?
        var user_profile_clicks: Int?
        
        // MARK: - Serialization
        
        typealias Keys = CodingKeys
        
        enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
            case impression_count
            case like_count
            case reply_count
            case retweet_count
            case url_link_clicks
            case user_profile_clicks
            
            var valueType: TwitterAPIPayloadValue {
                switch self {
                case .impression_count:
                    return .data(.int, inArray: false)
                case .like_count:
                    return .data(.int, inArray: false)
                case .reply_count:
                    return .data(.int, inArray: false)
                case .retweet_count:
                    return .data(.int, inArray: false)
                case .url_link_clicks:
                    return .data(.int, inArray: false)
                case .user_profile_clicks:
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
            case .impression_count:
                return self.impression_count
            case .like_count:
                return self.like_count
            case .reply_count:
                return self.reply_count
            case .retweet_count:
                return self.retweet_count
            case .url_link_clicks:
                return self.url_link_clicks
            case .user_profile_clicks:
                return self.user_profile_clicks
            }
        }

        func setValue(forKey key: CodingKeys, value: Any?) {
            switch key {
            case .impression_count:
                self.impression_count = value as? Int
            case .like_count:
                self.like_count = value as? Int
            case .reply_count:
                self.reply_count = value as? Int
            case .retweet_count:
                self.retweet_count = value as? Int
            case .url_link_clicks:
                self.url_link_clicks = value as? Int
            case .user_profile_clicks:
                self.user_profile_clicks = value as? Int
            }
        }
    }
    @objc(Tweet_PublicMetrics) class PublicMetrics: NSObject, DataSerializiingProtocol {
        var like_count: Int?
        var quote_count: Int?
        var retweet_count: Int?
        var reply_count: Int?

        // MARK: - Serialization
        
        typealias Keys = CodingKeys
        
        enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
            case like_count
            case quote_count
            case retweet_count
            case reply_count
            
            var valueType: TwitterAPIPayloadValue {
                switch self {
                case .like_count:
                    return .data(.int, inArray: false)
                case .quote_count:
                    return .data(.int, inArray: false)
                case .retweet_count:
                    return .data(.int, inArray: false)
                case .reply_count:
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
            case .like_count:
                return self.like_count
            case .quote_count:
                return self.quote_count
            case .retweet_count:
                return self.retweet_count
            case .reply_count:
                return self.reply_count
            }
        }

        func setValue(forKey key: CodingKeys, value: Any?) {
            switch key {
            case .like_count:
                self.like_count = value as? Int
            case .quote_count:
                self.quote_count = value as? Int
            case .retweet_count:
                self.retweet_count = value as? Int
            case .reply_count:
                self.reply_count = value as? Int
            }
        }
    }
    @objc(Tweet_ReferencedTweet) class ReferencedTweet: NSObject, DataSerializiingProtocol {
        var type: String?
        var id: String?

        // MARK: - Serialization
        
        typealias Keys = CodingKeys
        
        enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
            case id
            case type
            
            var valueType: TwitterAPIPayloadValue {
                switch self {
                case .id:
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
            case .id:
                return self.id
            case .type:
                return self.type
            }
        }

        func setValue(forKey key: CodingKeys, value: Any?) {
            switch key {
            case .id:
                self.id = value as? String
            case .type:
                self.type = value as? String
            }
        }
    }
    @objc(Tweet_Withheld) class Withheld: NSObject, DataSerializiingProtocol {
        var country_codes: [String]?
        var scope: String?
        
        // MARK: - Serialization
        
        typealias Keys = CodingKeys
        
        enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
            case country_codes
            case scope
            
            var valueType: TwitterAPIPayloadValue {
                switch self {
                case .country_codes:
                    return .data(.string, inArray: true)
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

    var attachments: Attachments?
    var author_id: String?
    var context_annotations: [ContextAnnotations]?
    var conversation_id: String?
    var created_at: Date?
    var entities: Entities?
    var geo: Geo?
    var id: String?
    var in_reply_to_user_id: String?
    var lang: String?
    var organic_metrics: OrganicMetric?
    var non_public_metrics: NonPublicMetric?
    var possibly_sensitive: Bool?
    var promoted_metrics: PromotedMetric?
    var public_metrics: PublicMetrics?
    var referenced_tweets: [ReferencedTweet]?
    var reply_settings: String?
    var source: String?
    var text: String?
    var withheld: String?
    
    // MARK: - Serialization
    
    typealias Keys = CodingKeys
    
    enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
        case attachments
        case author_id
        case context_annotations
        case conversation_id
        case created_at
        case entities
        case geo
        case id
        case in_reply_to_user_id
        case lang
        case organic_metrics
        case non_public_metrics
        case possibly_sensitive
        case promoted_metrics
        case public_metrics
        case referenced_tweets
        case reply_settings
        case source
        case text
        case withheld
        
        var valueType: TwitterAPIPayloadValue {
            switch self {
            case .attachments:
                return .object(.tweet_attachments, inArray: false)
            case .author_id:
                return .data(.string, inArray: false)
            case .context_annotations:
                return .object(.tweet_contextAnnotations, inArray: true)
            case .conversation_id:
                return .data(.string, inArray: false)
            case .created_at:
                return .data(.date, inArray: false)
            case .entities:
                return .object(.tweet_entities, inArray: false)
            case .geo:
                return .object(.tweet_geo, inArray: false)
            case .id:
                return .data(.string, inArray: false)
            case .in_reply_to_user_id:
                return .data(.string, inArray: false)
            case .lang:
                return .data(.string, inArray: false)
            case .organic_metrics:
                return .object(.tweet_organicmetric, inArray: false)
            case .non_public_metrics:
                return .object(.tweet_nonpublicmetric, inArray: false)
            case .possibly_sensitive:
                return .data(.bool, inArray: false)
            case .promoted_metrics:
                return .object(.tweet_promotedmetric, inArray: false)
            case .public_metrics:
                return .object(.tweet_publicmetric, inArray: false)
            case .referenced_tweets:
                return .object(.tweet_referencedTweet, inArray: true)
            case .reply_settings:
                return .data(.string, inArray: false)
            case .source:
                return .data(.string, inArray: false)
            case .text:
                return .data(.string, inArray: false)
            case .withheld:
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
        case .attachments:
            return self.attachments
        case .author_id:
            return self.author_id
        case .context_annotations:
            return self.context_annotations
        case .conversation_id:
            return self.conversation_id
        case .created_at:
            return self.created_at
        case .entities:
            return self.entities
        case .geo:
            return self.geo
        case .id:
            return self.id
        case .in_reply_to_user_id:
            return self.in_reply_to_user_id
        case .lang:
            return self.lang
        case .organic_metrics:
            return self.organic_metrics
        case .non_public_metrics:
            return self.non_public_metrics
        case .possibly_sensitive:
            return self.possibly_sensitive
        case .promoted_metrics:
            return self.promoted_metrics
        case .public_metrics:
            return self.public_metrics
        case .referenced_tweets:
            return self.referenced_tweets
        case .reply_settings:
            return self.reply_settings
        case .source:
            return self.source
        case .text:
            return self.text
        case .withheld:
            return self.withheld
        }
    }

    func setValue(forKey key: CodingKeys, value: Any?) {
        switch key {
        case .attachments:
            self.attachments = value as? Attachments
        case .author_id:
            self.author_id = value as? String
        case .context_annotations:
            self.context_annotations = value as? [ContextAnnotations]
        case .conversation_id:
            self.conversation_id = value as? String
        case .created_at:
            self.created_at = value as? Date
        case .entities:
            self.entities = value as? Entities
        case .geo:
            self.geo = value as? Geo
        case .id:
            self.id = value as? String
        case .in_reply_to_user_id:
            self.in_reply_to_user_id = value as? String
        case .lang:
            self.lang = value as? String
        case .organic_metrics:
            self.organic_metrics = value as? OrganicMetric
        case .non_public_metrics:
            self.non_public_metrics = value as? NonPublicMetric
        case .possibly_sensitive:
            self.possibly_sensitive = value as? Bool
        case .promoted_metrics:
            self.promoted_metrics = value as? PromotedMetric
        case .public_metrics:
            self.public_metrics = value as? PublicMetrics
        case .referenced_tweets:
            self.referenced_tweets = value as? [ReferencedTweet]
        case .reply_settings:
            self.reply_settings = value as? String
        case .source:
            self.source = value as? String
        case .text:
            self.text = value as? String
        case .withheld:
            self.withheld = value as? String
        }
    }
}
