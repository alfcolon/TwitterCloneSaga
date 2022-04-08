//
//  TwitterAPIPlacePayload.swift
//  TwitterCloneSaga
//
//  Created by Alfredo Colon on 4/8/22.
//

import Foundation

public class TwitterAPIPlacePayload: NSObject, DataSerializiingProtocol {
    @objc(Place_Geo) class Geo: NSObject, DataSerializiingProtocol {
        var bbox: [Float]?
        var type: String?
//            var properties:
        
        // MARK: - Serialization
        
        typealias Keys = CodingKeys
        
        enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
            case bbox
            case type
            
            var valueType: TwitterAPIPayloadValue {
                switch self {
                case .bbox:
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
            case .bbox:
                return self.bbox
            case .type:
                return self.type
            }
        }

        func setValue(forKey key: CodingKeys, value: Any?) {
            switch key {
            case .bbox:
                self.bbox = value as? [Float]
            case .type:
                self.type = value as? String
            }
        }
    }

    var contained_within: [String]?
    var country: String?
    var country_code: String?
    var full_name: String?
    var geo: String?
    var id: String?
    var name: String?
    var place_type: String?

    // MARK: - Serialization
    
    typealias Keys = CodingKeys
    
    enum CodingKeys: String, CodingKey, CaseIterable, ValueType {
        case contained_within
        case country
        case country_code
        case full_name
        case id
        case geo
        case name
        case place_type
        
        var valueType: TwitterAPIPayloadValue {
            switch self {
            case .contained_within:
                return .data(.string, inArray: true)
            case .country:
                return .data(.string, inArray: false)
            case .country_code:
                return .data(.string, inArray: false)
            case .full_name:
                return .data(.string, inArray: false)
            case .id:
                return .data(.string, inArray: false)
            case .geo:
                return .data(.string, inArray: false)
            case .name:
                return .data(.string, inArray: false)
            case .place_type:
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
        case .contained_within:
            return self.contained_within
        case .country:
            return self.country
        case .country_code:
            return self.country_code
        case .full_name:
            return self.full_name
        case .geo:
            return self.geo
        case .id:
            return self.id
        case .name:
            return self.name
        case .place_type:
            return self.place_type
        }
    }

    func setValue(forKey key: CodingKeys, value: Any?) {
        switch key {
        case .contained_within:
            self.contained_within = value as? [String]
        case .country:
            self.country = value as? String
        case .country_code:
            self.country_code = value as? String
        case .full_name:
            self.full_name = value as? String
        case .geo:
            self.geo = value as? String
        case .id:
            self.id = value as? String
        case .name:
            self.name = value as? String
        case .place_type:
            self.place_type = value as? String
        }
    }
}
