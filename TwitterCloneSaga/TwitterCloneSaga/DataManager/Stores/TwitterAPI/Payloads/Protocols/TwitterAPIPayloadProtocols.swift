//
//  TwitterAPIPayloadProtocols.swift
//  TwitterCloneSaga
//
//  Created by Alfredo Colon on 4/8/22.
//

import Foundation

public protocol ValueType {
    var valueType: TwitterAPIPayloadValue { get }
}

protocol DataSerializiingProtocol: NSObject, NSSecureCoding, Codable {
    associatedtype Keys: CodingKey, CaseIterable, ValueType
    
    func getValue(forKey key: Keys) -> Any?
    func setValue(forKey key: Keys, value: Any?)
    
    func json(decode decoder: Decoder)
    func json(encode encoder: Encoder)
    func transformable(decode coder: NSCoder)
    func transformable(encode coder: NSCoder)
}

extension DataSerializiingProtocol {
    func json(decode decoder: Decoder) {
        guard let container = try? decoder.container(keyedBy: Keys.self) else { fatalError() }
        
        for objectKey in Keys.allCases {
            let value: Any? = {
                switch objectKey.valueType {
                case .data(let data, inArray: let inArray):
                    switch data {
                    case .bool:
                        return inArray ?
                        try? container.decode([Bool].self, forKey: objectKey)
                        :
                        try? container.decode(Bool.self, forKey: objectKey)
                    case .date:
                        return inArray ?
                        try? container.decode([Date].self, forKey: objectKey)
                        :
                        try? container.decode(Date.self, forKey: objectKey)
                    case .float:
                        return inArray ?
                        try? container.decode([Float].self, forKey: objectKey)
                        :
                        try? container.decode(Float.self, forKey: objectKey)
                    case .int:
                        return inArray ?
                        try? container.decode([Int].self, forKey: objectKey)
                        :
                        try? container.decode(Int.self, forKey: objectKey)
                    case .string:
                        return inArray ?
                        try? container.decode([String].self, forKey: objectKey)
                        :
                        try? container.decode(String.self, forKey: objectKey)
                    }
                case .object(let object, let inArray):
                    switch object {
                    case .error:
                        return inArray ?
                        try? container.decode([TwitterAPIErrorPayload].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPIErrorPayload.self, forKey: objectKey)
                    case .includes:
                        return inArray ?
                        try? container.decode([TwitterAPIExpandedObjectsPayload].self, forKey: objectKey)
                        :
                        try? container.decode( TwitterAPIExpandedObjectsPayload.self, forKey: objectKey)
                    case .tweet:
                        return inArray ?
                        try? container.decode([TwitterAPITweetPayload].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPITweetPayload.self, forKey: objectKey)
                    case .tweet_attachments:
                        return inArray ?
                        try? container.decode([TwitterAPITweetPayload.Attachments].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPITweetPayload.Attachments.self, forKey: objectKey)
                    case .tweet_contextAnnotations:
                        return inArray ?
                        try? container.decode([TwitterAPITweetPayload.ContextAnnotations].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPITweetPayload.ContextAnnotations.self, forKey: objectKey)
                    case .tweet_attachments_contextAnnotations_domain:
                        return inArray ?
                        try? container.decode([TwitterAPITweetPayload.ContextAnnotations.Domain].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPITweetPayload.ContextAnnotations.Domain.self, forKey: objectKey)
                    case .tweet_attachments_contextAnnotations_entity:
                        return inArray ?
                        try? container.decode([TwitterAPITweetPayload.ContextAnnotations.Entity].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPITweetPayload.ContextAnnotations.Entity.self, forKey: objectKey)
                    case .tweet_entities:
                        return inArray ?
                        try? container.decode([TwitterAPITweetPayload.Entities].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPITweetPayload.Entities.self, forKey: objectKey)
                    case .tweet_entities_annotation:
                        return inArray ?
                        try? container.decode([TwitterAPITweetPayload.Entities.Annotation].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPITweetPayload.Entities.Annotation.self, forKey: objectKey)
                    case .tweet_entities_cashtag:
                        return inArray ?
                        try? container.decode([TwitterAPITweetPayload.Entities.Cashtag].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPITweetPayload.Entities.Cashtag.self, forKey: objectKey)
                    case .tweet_entities_hashtag:
                        return inArray ?
                        try? container.decode([TwitterAPITweetPayload.Entities.Hashtag].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPITweetPayload.Entities.Hashtag.self, forKey: objectKey)
                    case .tweet_entities_mention:
                        return inArray ?
                        try? container.decode([TwitterAPITweetPayload.Entities.Mention].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPITweetPayload.Entities.Mention.self, forKey: objectKey)
                    case .tweet_entities_url:
                        return inArray ?
                        try? container.decode([TwitterAPITweetPayload.Entities.URL].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPITweetPayload.Entities.URL.self, forKey: objectKey)
                    case .tweet_entities_url_image:
                        return inArray ?
                        try? container.decode([TwitterAPITweetPayload.Entities.URL.Image].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPITweetPayload.Entities.URL.Image.self, forKey: objectKey)
                    case .tweet_geo:
                        return inArray ?
                        try? container.decode([TwitterAPITweetPayload.Geo].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPITweetPayload.Geo.self, forKey: objectKey)
                    case .tweet_geo_coordinate:
                        return inArray ?
                        try? container.decode([TwitterAPITweetPayload.Geo.Coordinate].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPITweetPayload.Geo.Coordinate.self, forKey: objectKey)
                    case .tweet_organicmetric:
                        return inArray ?
                        try? container.decode([TwitterAPITweetPayload.OrganicMetric].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPITweetPayload.OrganicMetric.self, forKey: objectKey)
                    case .tweet_nonpublicmetric:
                        return inArray ?
                        try? container.decode([TwitterAPITweetPayload.NonPublicMetric].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPITweetPayload.NonPublicMetric.self, forKey: objectKey)
                    case .tweet_promotedmetric:
                        return inArray ?
                        try? container.decode([TwitterAPITweetPayload.PromotedMetric].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPITweetPayload.PromotedMetric.self, forKey: objectKey)
                    case .tweet_publicmetric:
                        return inArray ?
                        try? container.decode([TwitterAPITweetPayload.PublicMetrics].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPITweetPayload.PublicMetrics.self, forKey: objectKey)
                    case .tweet_referencedTweet:
                        return inArray ?
                        try? container.decode([TwitterAPITweetPayload.ReferencedTweet].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPITweetPayload.ReferencedTweet.self, forKey: objectKey)
                    case .tweet_Witthheld:
                        return inArray ?
                        try? container.decode([TwitterAPITweetPayload.Withheld].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPITweetPayload.Withheld.self, forKey: objectKey)
                    case .user:
                        return inArray ?
                        try? container.decode([TwitterAPIUserPayload].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPIUserPayload.self, forKey: objectKey)
                    case .user_entities:
                        return inArray ?
                        try? container.decode([TwitterAPIUserPayload.Entities].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPIUserPayload.Entities.self, forKey: objectKey)
                    case .user_entities_descripion:
                        return inArray ?
                        try? container.decode([TwitterAPIUserPayload.Entities.Description].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPIUserPayload.Entities.Description.self, forKey: objectKey)
                    case .user_entities_descripion_cashtag:
                        return inArray ?
                        try? container.decode([TwitterAPIUserPayload.Entities.Description.Cashtag].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPIUserPayload.Entities.Description.Cashtag.self, forKey: objectKey)
                    case .user_entities_descripion_hashtag:
                        return inArray ?
                        try? container.decode([TwitterAPIUserPayload.Entities.Description.Hashtag].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPIUserPayload.Entities.Description.Hashtag.self, forKey: objectKey)
                    case .user_entities_descripion_mention:
                        return inArray ?
                        try? container.decode([TwitterAPIUserPayload.Entities.Description.Mention].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPIUserPayload.Entities.Description.Mention.self, forKey: objectKey)
                    case .user_entities_descripion_url:
                        return inArray ?
                        try? container.decode([TwitterAPIUserPayload.Entities.Description.URL].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPIUserPayload.Entities.Description.URL.self, forKey: objectKey)
                    case .user_entities_url:
                        return inArray ?
                        try? container.decode([TwitterAPIUserPayload.Entities.URL].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPIUserPayload.Entities.URL.self, forKey: objectKey)
                    case .user_entities_url_urls:
                        return inArray ?
                        try? container.decode([TwitterAPIUserPayload.Entities.URL.URLS].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPIUserPayload.Entities.URL.URLS.self, forKey: objectKey)
                    case .user_publicmetrics:
                        return inArray ?
                        try? container.decode([TwitterAPIUserPayload.PublicMetrics].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPIUserPayload.PublicMetrics.self, forKey: objectKey)
                    case .user_withheld:
                        return inArray ?
                        try? container.decode([TwitterAPIUserPayload.WithHeld].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPIUserPayload.WithHeld.self, forKey: objectKey)
                    case .media:
                        return inArray ?
                        try? container.decode([TwitterAPIMediaPayload].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPIMediaPayload.self, forKey: objectKey)
                    case .media_metrics:
                        return inArray ?
                        try? container.decode([TwitterAPIMediaPayload.Metrics].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPIMediaPayload.Metrics.self, forKey: objectKey)
                    case .place:
                        return inArray ?
                        try? container.decode([TwitterAPIPlacePayload].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPIPlacePayload.self, forKey: objectKey)
                    case .place_geo:
                        return inArray ?
                        try? container.decode([TwitterAPIPlacePayload.Geo].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPIPlacePayload.Geo.self, forKey: objectKey)
                    case .timelinemetadata:
                        return inArray ?
                        try? container.decode([TwitterAPIUserTimelinePayload].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPIUserTimelinePayload.self, forKey: objectKey)
                    case .list:
                        return inArray ?
                        try? container.decode([TwitterAPIListPayload].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPIListPayload.self, forKey: objectKey)
                    case .poll:
                        return inArray ?
                        try? container.decode([TwitterAPIPollPayload].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPIPollPayload.self, forKey: objectKey)
                    case .space:
                        return inArray ?
                        try? container.decode([TwitterAPISpacePayload].self, forKey: objectKey)
                        :
                        try? container.decode(TwitterAPISpacePayload.self, forKey: objectKey)
                    }
                case .none:
                    return nil
                }
            }()
            self.setValue(forKey: objectKey, value: value)
        }
    }
    
    func json(encode encoder: Encoder) {
        var container = encoder.container(keyedBy: Keys.self)
        
        for key in Keys.allCases {
            guard let value: Any = getValue(forKey: key) else { continue }
            
            switch key.valueType {
            case .data(let data, inArray: let inArray):
                switch data {
                case .bool:
                    inArray ?
                    try! container.encode(value as? [Bool], forKey: key)
                    :
                    try! container.encode(value as? Bool, forKey: key)
                case .date:
                    inArray ?
                    try! container.encode(value as? [Date], forKey: key)
                    :
                    try! container.encode(value as? Date, forKey: key)
                case .float:
                    inArray ?
                    try! container.encode(value as? [Float], forKey: key)
                    :
                    try! container.encode(value as? Float, forKey: key)
                case .int:
                    inArray ?
                    try! container.encode(value as? [Int], forKey: key)
                    :
                    try! container.encode(value as? Int, forKey: key)
                case .string:
                    inArray ?
                    try! container.encode(value as? [String], forKey: key)
                    :
                    try! container.encode(value as? String, forKey: key)
                }
            case .object(let object, let inArray):
                switch object {
                case .error:
                    inArray ?
                    try! container.encode(value as? [TwitterAPIErrorPayload], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPIErrorPayload, forKey: key)
                case .includes:
                    inArray ?
                    try! container.encode(value as? [ TwitterAPIExpandedObjectsPayload], forKey: key)
                    :
                    try! container.encode(value as?  TwitterAPIExpandedObjectsPayload, forKey: key)
                case .tweet:
                    inArray ?
                    try! container.encode(value as? [TwitterAPITweetPayload], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPITweetPayload, forKey: key)
                case .tweet_attachments:
                    inArray ?
                    try! container.encode(value as? [TwitterAPITweetPayload.Attachments], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPITweetPayload.Attachments, forKey: key)
                case .tweet_contextAnnotations:
                    inArray ?
                    try! container.encode(value as? [TwitterAPITweetPayload.ContextAnnotations], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPITweetPayload.ContextAnnotations, forKey: key)
                case .tweet_attachments_contextAnnotations_domain:
                    inArray ?
                    try! container.encode(value as? [TwitterAPITweetPayload.ContextAnnotations.Domain], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPITweetPayload.ContextAnnotations.Domain, forKey: key)
                case .tweet_attachments_contextAnnotations_entity:
                    inArray ?
                    try! container.encode(value as? [TwitterAPITweetPayload.ContextAnnotations.Entity], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPITweetPayload.ContextAnnotations.Entity, forKey: key)
                case .tweet_entities:
                    inArray ?
                    try! container.encode(value as? [TwitterAPITweetPayload.Entities], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPITweetPayload.Entities, forKey: key)
                case .tweet_entities_annotation:
                    inArray ?
                    try! container.encode(value as? [TwitterAPITweetPayload.Entities.Annotation], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPITweetPayload.Entities.Annotation, forKey: key)
                case .tweet_entities_cashtag:
                    inArray ?
                    try! container.encode(value as? [TwitterAPITweetPayload.Entities.Cashtag], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPITweetPayload.Entities.Cashtag, forKey: key)
                case .tweet_entities_hashtag:
                    inArray ?
                    try! container.encode(value as? [TwitterAPITweetPayload.Entities.Hashtag], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPITweetPayload.Entities.Hashtag, forKey: key)
                case .tweet_entities_mention:
                    inArray ?
                    try! container.encode(value as? [TwitterAPITweetPayload.Entities.Mention], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPITweetPayload.Entities.Mention, forKey: key)
                case .tweet_entities_url:
                    inArray ?
                    try! container.encode(value as? [TwitterAPITweetPayload.Entities.URL], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPITweetPayload.Entities.URL, forKey: key)
                case .tweet_entities_url_image:
                    inArray ?
                    try! container.encode(value as? [TwitterAPITweetPayload.Entities.URL.Image], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPITweetPayload.Entities.URL.Image, forKey: key)
                case .tweet_geo:
                    inArray ?
                    try! container.encode(value as? [TwitterAPITweetPayload.Geo], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPITweetPayload.Geo, forKey: key)
                case .tweet_geo_coordinate:
                    inArray ?
                    try! container.encode(value as? [TwitterAPITweetPayload.Geo.Coordinate], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPITweetPayload.Geo.Coordinate, forKey: key)
                case .tweet_organicmetric:
                    inArray ?
                    try! container.encode(value as? [TwitterAPITweetPayload.OrganicMetric], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPITweetPayload.OrganicMetric, forKey: key)
                case .tweet_nonpublicmetric:
                    inArray ?
                    try! container.encode(value as? [TwitterAPITweetPayload.NonPublicMetric], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPITweetPayload.NonPublicMetric, forKey: key)
                case .tweet_promotedmetric:
                    inArray ?
                    try! container.encode(value as? [TwitterAPITweetPayload.PromotedMetric], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPITweetPayload.PromotedMetric, forKey: key)
                case .tweet_publicmetric:
                    inArray ?
                    try! container.encode(value as? [TwitterAPITweetPayload.PublicMetrics], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPITweetPayload.PublicMetrics, forKey: key)
                case .tweet_referencedTweet:
                    inArray ?
                    try! container.encode(value as? [TwitterAPITweetPayload.ReferencedTweet], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPITweetPayload.ReferencedTweet, forKey: key)
                case .tweet_Witthheld:
                    inArray ?
                    try! container.encode(value as? [TwitterAPITweetPayload.Withheld], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPITweetPayload.Withheld, forKey: key)
                case .user:
                    inArray ?
                    try! container.encode(value as? [TwitterAPIUserPayload], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPIUserPayload, forKey: key)
                case .user_entities:
                    inArray ?
                    try! container.encode(value as? [TwitterAPIUserPayload.Entities], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPIUserPayload.Entities, forKey: key)
                case .user_entities_descripion:
                    inArray ?
                    try! container.encode(value as? [TwitterAPIUserPayload.Entities.Description], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPIUserPayload.Entities.Description, forKey: key)
                case .user_entities_descripion_cashtag:
                    inArray ?
                    try! container.encode(value as? [TwitterAPIUserPayload.Entities.Description.Cashtag], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPIUserPayload.Entities.Description.Cashtag, forKey: key)
                case .user_entities_descripion_hashtag:
                    inArray ?
                    try! container.encode(value as? [TwitterAPIUserPayload.Entities.Description.Hashtag], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPIUserPayload.Entities.Description.Hashtag, forKey: key)
                case .user_entities_descripion_mention:
                    inArray ?
                    try! container.encode(value as? [TwitterAPIUserPayload.Entities.Description.Mention], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPIUserPayload.Entities.Description.Mention, forKey: key)
                case .user_entities_descripion_url:
                    inArray ?
                    try! container.encode(value as? [TwitterAPIUserPayload.Entities.Description.URL], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPIUserPayload.Entities.Description.URL, forKey: key)
                case .user_entities_url:
                    inArray ?
                    try! container.encode(value as? [TwitterAPIUserPayload.Entities.URL], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPIUserPayload.Entities.URL, forKey: key)
                case .user_entities_url_urls:
                    inArray ?
                    try! container.encode(value as? [TwitterAPIUserPayload.Entities.URL.URLS], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPIUserPayload.Entities.URL.URLS, forKey: key)
                case .user_publicmetrics:
                    inArray ?
                    try! container.encode(value as? [TwitterAPIUserPayload.PublicMetrics], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPIUserPayload.PublicMetrics, forKey: key)
                case .user_withheld:
                    inArray ?
                    try! container.encode(value as? [TwitterAPIUserPayload.WithHeld], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPIUserPayload.WithHeld, forKey: key)
                case .media:
                    inArray ?
                    try! container.encode(value as? [TwitterAPIMediaPayload], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPIMediaPayload, forKey: key)
                case .media_metrics:
                    inArray ?
                    try! container.encode(value as? [TwitterAPIMediaPayload.Metrics], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPIMediaPayload.Metrics, forKey: key)
                case .place:
                    inArray ?
                    try! container.encode(value as? [TwitterAPIPlacePayload], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPIPlacePayload, forKey: key)
                case .place_geo:
                    inArray ?
                    try! container.encode(value as? [TwitterAPIPlacePayload.Geo], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPIPlacePayload.Geo, forKey: key)
                case .timelinemetadata:
                    inArray ?
                    try! container.encode(value as? [TwitterAPIUserTimelinePayload], forKey: key)
                    :
                    try! container.encode(value as? TwitterAPIUserTimelinePayload, forKey: key)
                case .list:
                    inArray ?
                    try! container.encode(value as! [TwitterAPIListPayload], forKey: key)
                    :
                    try! container.encode(value as! TwitterAPIListPayload, forKey: key)
                case .poll:
                    inArray ?
                    try! container.encode(value as! [TwitterAPIPollPayload], forKey: key)
                    :
                    try! container.encode(value as! TwitterAPIPollPayload, forKey: key)
                case .space:
                    inArray ?
                    try! container.encode(value as! [TwitterAPISpacePayload], forKey: key)
                    :
                    try! container.encode(value as! TwitterAPISpacePayload, forKey: key)
                }
            default:
                break
            }
        }
    }
    
    func transformable(decode coder: NSCoder) {
        for objectKey in Keys.allCases {
            let value: Any? = {
                switch objectKey.valueType {
                case .data(let data, inArray: let inArray):
                    switch data {
                case .bool:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, NSNumber.self].self, forKey: objectKey.stringValue) as? [Bool]
                    :
                    coder.decodeObject(of: NSNumber.self, forKey: objectKey.stringValue) as? Bool
                case .date:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, NSDate.self].self, forKey: objectKey.stringValue) as? [Date]
                    :
                    coder.decodeObject(of: NSDate.self, forKey: objectKey.stringValue) as Date?
                case .float:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, NSNumber.self].self, forKey: objectKey.stringValue) as? [Float]
                    :
                    coder.decodeObject(of: NSNumber.self, forKey: objectKey.stringValue) as? Float
                case .int:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, NSNumber.self].self, forKey: objectKey.stringValue) as? [Int]
                    :
                    coder.decodeObject(of: NSNumber.self, forKey: objectKey.stringValue) as? Int
                case .string:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, NSString.self].self, forKey: objectKey.stringValue) as? [String]
                    :
                    coder.decodeObject(of: NSString.self, forKey: objectKey.stringValue) as String?
                }
                case .object(let object, let inArray):
                switch object {
                case .error:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPIErrorPayload.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPIErrorPayload.self, forKey: objectKey.stringValue)
                case .includes:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self,  TwitterAPIExpandedObjectsPayload.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of:  TwitterAPIExpandedObjectsPayload.self, forKey: objectKey.stringValue)
                case .tweet:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPITweetPayload.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPITweetPayload.self, forKey: objectKey.stringValue)
                case .tweet_attachments:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPITweetPayload.Attachments.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPITweetPayload.Attachments.self, forKey: objectKey.stringValue)
                case .tweet_contextAnnotations:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPITweetPayload.ContextAnnotations.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPITweetPayload.ContextAnnotations.self, forKey: objectKey.stringValue)
                case .tweet_attachments_contextAnnotations_domain:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPITweetPayload.ContextAnnotations.Domain.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPITweetPayload.ContextAnnotations.Domain.self, forKey: objectKey.stringValue)
                case .tweet_attachments_contextAnnotations_entity:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPITweetPayload.ContextAnnotations.Entity.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPITweetPayload.ContextAnnotations.Entity.self, forKey: objectKey.stringValue)
                case .tweet_entities:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPITweetPayload.Entities.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPITweetPayload.Entities.self, forKey: objectKey.stringValue)
                case .tweet_entities_annotation:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPITweetPayload.Entities.Annotation.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPITweetPayload.Entities.Annotation.self, forKey: objectKey.stringValue)
                case .tweet_entities_cashtag:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPITweetPayload.Entities.Cashtag.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPITweetPayload.Entities.Cashtag.self, forKey: objectKey.stringValue)
                case .tweet_entities_hashtag:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPITweetPayload.Entities.Hashtag.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPITweetPayload.Entities.Hashtag.self, forKey: objectKey.stringValue)
                case .tweet_entities_mention:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPITweetPayload.Entities.Mention.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPITweetPayload.Entities.Mention.self, forKey: objectKey.stringValue)
                case .tweet_entities_url:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPITweetPayload.Entities.URL.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPITweetPayload.Entities.URL.self, forKey: objectKey.stringValue)
                case .tweet_entities_url_image:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPITweetPayload.Entities.URL.Image.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPITweetPayload.Entities.URL.Image.self, forKey: objectKey.stringValue)
                case .tweet_geo:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPITweetPayload.Geo.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPITweetPayload.Geo.self, forKey: objectKey.stringValue)
                case .tweet_geo_coordinate:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPITweetPayload.Geo.Coordinate.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPITweetPayload.Geo.Coordinate.self, forKey: objectKey.stringValue)
                case .tweet_organicmetric:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPITweetPayload.OrganicMetric.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPITweetPayload.OrganicMetric.self, forKey: objectKey.stringValue)
                case .tweet_nonpublicmetric:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPITweetPayload.NonPublicMetric.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPITweetPayload.NonPublicMetric.self, forKey: objectKey.stringValue)
                case .tweet_promotedmetric:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPITweetPayload.PromotedMetric.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPITweetPayload.PromotedMetric.self, forKey: objectKey.stringValue)
                case .tweet_publicmetric:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPITweetPayload.PublicMetrics.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPITweetPayload.PublicMetrics.self, forKey: objectKey.stringValue)
                case .tweet_referencedTweet:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPITweetPayload.ReferencedTweet.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPITweetPayload.ReferencedTweet.self, forKey: objectKey.stringValue)
                case .tweet_Witthheld:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPITweetPayload.Withheld.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPITweetPayload.Withheld.self, forKey: objectKey.stringValue)
                case .user:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPIUserPayload.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPIUserPayload.self, forKey: objectKey.stringValue)
                case .user_entities:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPIUserPayload.Entities.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPIUserPayload.Entities.self, forKey: objectKey.stringValue)
                case .user_entities_descripion:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPIUserPayload.Entities.Description.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPIUserPayload.Entities.Description.self, forKey: objectKey.stringValue)
                case .user_entities_descripion_cashtag:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPIUserPayload.Entities.Description.Cashtag.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPIUserPayload.Entities.Description.Cashtag.self, forKey: objectKey.stringValue)
                case .user_entities_descripion_hashtag:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPIUserPayload.Entities.Description.Hashtag.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPIUserPayload.Entities.Description.Hashtag.self, forKey: objectKey.stringValue)
                case .user_entities_descripion_mention:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPIUserPayload.Entities.Description.Mention.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPIUserPayload.Entities.Description.Mention.self, forKey: objectKey.stringValue)
                case .user_entities_descripion_url:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPIUserPayload.Entities.Description.URL.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPIUserPayload.Entities.Description.URL.self, forKey: objectKey.stringValue)
                case .user_entities_url:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPIUserPayload.Entities.URL.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPIUserPayload.Entities.URL.self, forKey: objectKey.stringValue)
                case .user_entities_url_urls:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPIUserPayload.Entities.URL.URLS.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPIUserPayload.Entities.URL.URLS.self, forKey: objectKey.stringValue)
                case .user_publicmetrics:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPIUserPayload.PublicMetrics.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPIUserPayload.PublicMetrics.self, forKey: objectKey.stringValue)
                case .user_withheld:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPIUserPayload.WithHeld.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPIUserPayload.WithHeld.self, forKey: objectKey.stringValue)
                case .media:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPIMediaPayload.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPIMediaPayload.self, forKey: objectKey.stringValue)
                case .media_metrics:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPIMediaPayload.Metrics.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPIMediaPayload.Metrics.self, forKey: objectKey.stringValue)
                case .place:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPIPlacePayload.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPIPlacePayload.self, forKey: objectKey.stringValue)
                case .place_geo:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPIPlacePayload.Geo.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPIPlacePayload.Geo.self, forKey: objectKey.stringValue)
                case .timelinemetadata:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPIUserTimelinePayload.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPIUserTimelinePayload.self, forKey: objectKey.stringValue)
                case .list:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPIListPayload.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPIListPayload.self, forKey: objectKey.stringValue)
                case .poll:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPIPollPayload.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPIPollPayload.self, forKey: objectKey.stringValue)
                case .space:
                    return inArray ?
                    coder.decodeObject(of: [NSArray.self, TwitterAPISpacePayload.self].self, forKey: objectKey.stringValue)
                    :
                    coder.decodeObject(of: TwitterAPISpacePayload.self, forKey: objectKey.stringValue)
                }
                case .none:
                    return nil
                }
            }()
            self.setValue(forKey: objectKey, value: value)
        }
    }

    func transformable(encode coder: NSCoder) {
        for key in Keys.allCases {
            guard let value: Any = getValue(forKey: key) else { continue }
            coder.encode(value, forKey: key.stringValue)
        }
    }
}
