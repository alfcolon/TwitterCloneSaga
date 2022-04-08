//
//  TwitterAPIPayloadValue.swift
//  TwitterCloneSaga
//
//  Created by Alfredo Colon on 4/8/22.
//

import Foundation

public enum TwitterAPIPayloadValue {
    case object(Object, inArray: Bool)
    case data(Data, inArray: Bool)
    case none
    
    public enum Object: String, Decodable, CaseIterable {
        case error
        case includes
        case tweet
        case tweet_attachments
        case tweet_contextAnnotations
        case tweet_attachments_contextAnnotations_domain
        case tweet_attachments_contextAnnotations_entity
        case tweet_entities
        case tweet_entities_annotation
        case tweet_entities_cashtag
        case tweet_entities_hashtag
        case tweet_entities_mention
        case tweet_entities_url
        case tweet_entities_url_image
        case tweet_geo
        case tweet_geo_coordinate
        case tweet_organicmetric
        case tweet_nonpublicmetric
        case tweet_promotedmetric
        case tweet_publicmetric
        case tweet_referencedTweet
        case tweet_Witthheld
        case user
        case user_entities
        case user_entities_descripion
        case user_entities_descripion_cashtag
        case user_entities_descripion_hashtag
        case user_entities_descripion_mention
        case user_entities_descripion_url
        case user_entities_url
        case user_entities_url_urls
        case user_publicmetrics
        case user_withheld
        case media
        case media_metrics
        case place
        case place_geo
        case timelinemetadata
        case poll
        case space
        case list
        
        var classType1: AnyObject {
            switch self {
            case .error:
                return TwitterAPIErrorPayload.self
            case .includes:
                return  TwitterAPIExpandedObjectsPayload.self
            case .tweet:
                return TwitterAPITweetPayload.self
            case .tweet_attachments:
                return TwitterAPITweetPayload.Attachments.self
            case .tweet_contextAnnotations:
                return TwitterAPITweetPayload.ContextAnnotations.self
            case .tweet_attachments_contextAnnotations_domain:
                return TwitterAPITweetPayload.ContextAnnotations.Domain.self
            case .tweet_attachments_contextAnnotations_entity:
                return TwitterAPITweetPayload.ContextAnnotations.Entity.self
            case .tweet_entities:
                return TwitterAPITweetPayload.Entities.self
            case .tweet_entities_annotation:
                return TwitterAPITweetPayload.Entities.Annotation.self
            case .tweet_entities_cashtag:
                return TwitterAPITweetPayload.Entities.Cashtag.self
            case .tweet_entities_hashtag:
                return TwitterAPITweetPayload.Entities.Hashtag.self
            case .tweet_entities_mention:
                return TwitterAPITweetPayload.Entities.Mention.self
            case .tweet_entities_url:
                return TwitterAPITweetPayload.Entities.URL.self
            case .tweet_entities_url_image:
                return TwitterAPITweetPayload.Entities.URL.Image.self
            case .tweet_geo:
                return TwitterAPITweetPayload.Geo.self
            case .tweet_geo_coordinate:
                return TwitterAPITweetPayload.Geo.Coordinate.self
            case .tweet_organicmetric:
                return TwitterAPITweetPayload.OrganicMetric.self
            case .tweet_nonpublicmetric:
                return TwitterAPITweetPayload.NonPublicMetric.self
            case .tweet_promotedmetric:
                return TwitterAPITweetPayload.PromotedMetric.self
            case .tweet_publicmetric:
                return TwitterAPITweetPayload.PublicMetrics.self
            case .tweet_referencedTweet:
                return TwitterAPITweetPayload.ReferencedTweet.self
            case .tweet_Witthheld:
                return TwitterAPITweetPayload.Withheld.self
            case .user:
                return TwitterAPIUserPayload.self
            case .user_entities:
                return TwitterAPIUserPayload.Entities.self
            case .user_entities_descripion:
                return TwitterAPIUserPayload.Entities.Description.self
            case .user_entities_descripion_cashtag:
                return TwitterAPIUserPayload.Entities.Description.Cashtag.self
            case .user_entities_descripion_hashtag:
                return TwitterAPIUserPayload.Entities.Description.Hashtag.self
            case .user_entities_descripion_mention:
                return TwitterAPIUserPayload.Entities.Description.Mention.self
            case .user_entities_descripion_url:
                return TwitterAPIUserPayload.Entities.Description.URL.self
            case .user_entities_url:
                return TwitterAPIUserPayload.Entities.URL.self
            case .user_entities_url_urls:
                return TwitterAPIUserPayload.Entities.URL.URLS.self
            case .user_publicmetrics:
                return TwitterAPIUserPayload.PublicMetrics.self
            case .user_withheld:
                return TwitterAPIUserPayload.WithHeld.self
            case .media:
                return TwitterAPIMediaPayload.self
            case .media_metrics:
                return TwitterAPIMediaPayload.Metrics.self
            case .place:
                return TwitterAPIPlacePayload.self
            case .place_geo:
                return TwitterAPIPlacePayload.Geo.self
            case .timelinemetadata:
                return TwitterAPIUserTimelinePayload.self
            case .poll:
                return TwitterAPIPollPayload.self
            case .space:
                return TwitterAPISpacePayload.self
            case .list:
                return TwitterAPIListPayload.self
            }
        }
        
        var jsonDecodingClass: AnyClass {
            switch self {
            case .error:
                return TwitterAPIErrorPayload.self
            case .includes:
                return  TwitterAPIExpandedObjectsPayload.self
            case .tweet:
                return TwitterAPITweetPayload.self
            case .tweet_attachments:
                return TwitterAPITweetPayload.Attachments.self
            case .tweet_contextAnnotations:
                return TwitterAPITweetPayload.ContextAnnotations.self
            case .tweet_attachments_contextAnnotations_domain:
                return TwitterAPITweetPayload.ContextAnnotations.Domain.self
            case .tweet_attachments_contextAnnotations_entity:
                return TwitterAPITweetPayload.ContextAnnotations.Entity.self
            case .tweet_entities:
                return TwitterAPITweetPayload.Entities.self
            case .tweet_entities_annotation:
                return TwitterAPITweetPayload.Entities.Annotation.self
            case .tweet_entities_cashtag:
                return TwitterAPITweetPayload.Entities.Cashtag.self
            case .tweet_entities_hashtag:
                return TwitterAPITweetPayload.Entities.Hashtag.self
            case .tweet_entities_mention:
                return TwitterAPITweetPayload.Entities.Mention.self
            case .tweet_entities_url:
                return TwitterAPITweetPayload.Entities.URL.self
            case .tweet_entities_url_image:
                return TwitterAPITweetPayload.Entities.URL.Image.self
            case .tweet_geo:
                return TwitterAPITweetPayload.Geo.self
            case .tweet_geo_coordinate:
                return TwitterAPITweetPayload.Geo.Coordinate.self
            case .tweet_organicmetric:
                return TwitterAPITweetPayload.OrganicMetric.self
            case .tweet_nonpublicmetric:
                return TwitterAPITweetPayload.NonPublicMetric.self
            case .tweet_promotedmetric:
                return TwitterAPITweetPayload.PromotedMetric.self
            case .tweet_publicmetric:
                return TwitterAPITweetPayload.PublicMetrics.self
            case .tweet_referencedTweet:
                return TwitterAPITweetPayload.ReferencedTweet.self
            case .tweet_Witthheld:
                return TwitterAPITweetPayload.Withheld.self
            case .user:
                return TwitterAPIUserPayload.self
            case .user_entities:
                return TwitterAPIUserPayload.Entities.self
            case .user_entities_descripion:
                return TwitterAPIUserPayload.Entities.Description.self
            case .user_entities_descripion_cashtag:
                return TwitterAPIUserPayload.Entities.Description.Cashtag.self
            case .user_entities_descripion_hashtag:
                return TwitterAPIUserPayload.Entities.Description.Hashtag.self
            case .user_entities_descripion_mention:
                return TwitterAPIUserPayload.Entities.Description.Mention.self
            case .user_entities_descripion_url:
                return TwitterAPIUserPayload.Entities.Description.URL.self
            case .user_entities_url:
                return TwitterAPIUserPayload.Entities.URL.self
            case .user_entities_url_urls:
                return TwitterAPIUserPayload.Entities.URL.URLS.self
            case .user_publicmetrics:
                return TwitterAPIUserPayload.PublicMetrics.self
            case .user_withheld:
                return TwitterAPIUserPayload.WithHeld.self
            case .media:
                return TwitterAPIMediaPayload.self
            case .media_metrics:
                return TwitterAPIMediaPayload.Metrics.self
            case .place:
                return TwitterAPIPlacePayload.self
            case .place_geo:
                return TwitterAPIPlacePayload.Geo.self
            case .timelinemetadata:
                return TwitterAPIUserTimelinePayload.self
            case .poll:
                return TwitterAPIPollPayload.self
            case .space:
                return TwitterAPISpacePayload.self
            case .list:
                return TwitterAPIListPayload.self
            }
        }
    }
    public enum Data: String, Decodable, CaseIterable {
        case bool
        case date
        case float
        case int
        case string
    }
}
