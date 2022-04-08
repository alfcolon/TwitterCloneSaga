//
//  TwitterAPIMediaPayload.swift
//  TwitterCloneSaga
//
//  Created by Alfredo Colon on 4/8/22.
//

import Foundation

public class TwitterAPIMediaPayload: NSObject, DataSerializiingProtocol {
    @objc(Media_Metrics) class Metrics: NSObject, DataSerializiingProtocol {
        var playback_0_count: Int?
        var playback_100_count: Int?
        var playback_25_count: Int?
        var playback_50_count: Int?
        var playback_75_count: Int?
        var view_count: Int?
        
        // MARK: - Serialization
        
        typealias Keys = CodingKeys
        
        enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
            case playback_0_count = "playback_0_count"
            case playback_100_count = "playback_100_count"
            case playback_25_count = "playback_25_count"
            case playback_50_count = "playback_50_count"
            case playback_75_count = "playback_75_count"
            case view_count = "view_count"
            
            var valueType: TwitterAPIPayloadValue {
                switch self {
                case .playback_0_count:
                    return .data(.int, inArray: false)
                case .playback_100_count:
                    return .data(.int, inArray: false)
                case .playback_25_count:
                    return .data(.int, inArray: false)
                case .playback_50_count:
                    return .data(.int, inArray: false)
                case .playback_75_count:
                    return .data(.int, inArray: false)
                case .view_count:
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
            case .playback_0_count:
                return self.playback_0_count
            case .playback_100_count:
                return self.playback_100_count
            case .playback_25_count:
                return self.playback_25_count
            case .playback_50_count:
                return self.playback_50_count
            case .playback_75_count:
                return self.playback_75_count
            case .view_count:
                return self.view_count
            }
        }

        func setValue(forKey key: CodingKeys, value: Any?) {
            switch key {
            case .playback_0_count:
                self.playback_0_count = value as? Int
            case .playback_100_count:
                self.playback_100_count = value as? Int
            case .playback_25_count:
                self.playback_25_count = value as? Int
            case .playback_50_count:
                self.playback_50_count = value as? Int
            case .playback_75_count:
                self.playback_75_count = value as? Int
            case .view_count:
                self.view_count = value as? Int
            }
        }
    }

    var alt_text: String?
    var duration_ms: Int?
    var height: Int?
    var media_key: String?
    var non_public_metrics: Metrics?
    var organic: Metrics?
    var preview_image_url: String?
    var public_metrics: Metrics?
    var type: String?
    var url: String? // not in object definition
    var width: Int?
    
    // MARK: - Serialization
    
    typealias Keys = CodingKeys
    
    enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
        case alt_text
        case duration_ms
        case height
        case media_key
        case non_public_metrics
        case organic
        case preview_image_url
        case public_metrics
        case type
        case url

        case width
        
        var valueType: TwitterAPIPayloadValue {
            switch self {
            case .alt_text:
                return .data(.string, inArray: false)
            case .duration_ms:
                return .data(.int, inArray: false)
            case .height:
                return .data(.int, inArray: false)
            case .media_key:
                return .data(.string, inArray: false)
            case .non_public_metrics:
                return .object(.media_metrics, inArray: false)
            case .organic:
                return .object(.media_metrics, inArray: false)
            case .preview_image_url:
                return .data(.string, inArray: false)
            case .public_metrics:
                return .object(.media_metrics, inArray: false)
            case .type:
                return .data(.string, inArray: false)
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
        case .alt_text:
            return self.alt_text
        case .duration_ms:
            return self.duration_ms
        case .height:
            return self.height
        case .media_key:
            return self.media_key
        case .non_public_metrics:
            return self.non_public_metrics
        case .organic:
            return self.organic
        case .preview_image_url:
            return self.preview_image_url
        case .public_metrics:
            return self.public_metrics
        case .type:
            return self.type
        case .url:
            return self.url
        case .width:
            return self.width
        }
    }

    func setValue(forKey key: CodingKeys, value: Any?) {
        switch key {
        case .alt_text:
            self.alt_text = value as? String
        case .duration_ms:
            self.duration_ms = value as? Int
        case .height:
            self.height = value as? Int
        case .media_key:
            self.media_key = value as? String
        case .non_public_metrics:
            self.non_public_metrics = value as? Metrics
        case .organic:
            self.organic = value as? Metrics
        case .preview_image_url:
            self.preview_image_url = value as? String
        case .public_metrics:
            self.public_metrics = value as? Metrics
        case .type:
            self.type = value as? String
        case .url:
            self.url = value as? String
        case .width:
            self.width = value as? Int
        }
    }
}
