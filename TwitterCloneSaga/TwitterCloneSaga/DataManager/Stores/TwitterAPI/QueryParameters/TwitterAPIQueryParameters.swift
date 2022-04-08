//
//  TwitterAPIQueryParameters.swift
//  TwitterCloneSaga
//
//  Created by Alfredo Colon on 4/8/22.
//

import Foundation

enum QueryParameter {
    enum Expansion: TwitterAPIQueryParameterProtocol, TwitterAPIQueryParameterKeyProtocol {
        case media(Media, options: [MediaField])
        case place(Place, options: [PlaceField])
        case poll(Poll, options: [PollField])
        case tweet(Tweet, options: [TweetField])
        case user([User], options: [UserField])

        enum Media: String, CaseIterable, TwitterAPIQueryParameterValueProtocol {
            case attachments_media_keys // Returns a media object representing the images, videos, GIFs included in the Tweet

            var parameterValue: String {
                return "attachments.media_keys"
            }
        }
        enum Place: String, CaseIterable, TwitterAPIQueryParameterValueProtocol {
            case geo_place_id = "geo.place_id" // Returns a place object containing metadata for the location tagged in the Tweet

            var parameterValue: String {
                return self.rawValue
            }
        }
        enum Poll: String, CaseIterable, TwitterAPIQueryParameterValueProtocol {
            case attachments_poll_ids // Returns a poll object containing metadata for the poll included in the Tweet

            var parameterValue: String {
                return "attachments.poll_ids"
            }
        }
        enum Tweet: String, CaseIterable, TwitterAPIQueryParameterValueProtocol {
            case referenced_tweets_id = "referenced_tweets.id" // Returns a Tweet object that this Tweet is referencing (either as a Retweet, Quoted Tweet, or reply)
            case referenced_tweets_id_author_id = "referenced_tweets.id.author_id"
            case pinned_tweet_id
            
            var parameterValue: String {
                return self.rawValue
            }
        }
        enum User: String, CaseIterable, TwitterAPIQueryParameterValueProtocol {
            case author_id // Returns a user object representing the Tweet’s author
            case entities_mentions_username = "entities.mentions.username" // Returns a user object for the user mentioned in the Tweet
            case in_reply_to_user_id//Returns a user object representing the Tweet author this requested Tweet is a reply of
            case referenced_tweets_id_author_id = "referenced_tweets.id.author_id"  // Returns a user object for the author of the referenced Tweet

            var parameterValue: String {
                return self.rawValue
            }
        }
        
        static var parameterKey: String { return "expansions" }
        
        static func parameter(from values: [QueryParameter.Expansion]) -> String {
            var expansionValues: [TwitterAPIQueryParameterValueProtocol] = []
            var optionsString: String = ""
            
            for value in values {
                switch value {
                case .media(let expansion, let options):
                    expansionValues.append(expansion)
                    optionsString += MediaField.parameter(from: options)
                case .place(let expansion, let options):
                    expansionValues.append(expansion)
                    optionsString += PlaceField.parameter(from: options)
                case .poll(let expansion, let options):
                    expansionValues.append(expansion)
                    optionsString += PollField.parameter(from: options)
                case .tweet(let expansion, let options):
                    expansionValues.append(expansion)
                    optionsString += TweetField.parameter(from: options)
                case .user(let expansions, let options):
                    expansionValues += expansions
                    optionsString += UserField.parameter(from: options)
                }
            }
            let expansionString: String = self.valueString(values: expansionValues)
            
            return "&" + Self.parameterKey + "=" + expansionString + optionsString
        }

    }
    enum MediaField: String, CaseIterable, TwitterAPIQueryParameterKeyProtocol, TwitterAPIQueryParameterValueProtocol, TwitterAPIQueryParameterProtocol   {
        case alt_text
        case duration_ms
        case height
        case media_key
        case non_public_metrics
        case organic_metrics
        case preview_image_url
        case promoted_metrics
        case public_metrics
        case type
        case url
        case width

        static var parameterKey: String { return "media.fields" }
        
        var parameterValue: String { return self.rawValue }
    }
    enum PlaceField: String, CaseIterable, TwitterAPIQueryParameterKeyProtocol, TwitterAPIQueryParameterValueProtocol, TwitterAPIQueryParameterProtocol {
        case contained_within
        case country
        case country_code
        case full_name
        case geo
        case id
        case name
        case place_type
        
        static var parameterKey: String { return "place.fields" }
        
        var parameterValue: String { return self.rawValue }
    }
    enum PollField: String, CaseIterable, TwitterAPIQueryParameterKeyProtocol, TwitterAPIQueryParameterValueProtocol, TwitterAPIQueryParameterProtocol {
        case duration_minutes
        case end_datetime
        case id
        case options
        case voting_status
        
        static var parameterKey: String { return "poll.fields" }
        
        var parameterValue: String{ return self.rawValue }
    }
    enum TweetField: String, CaseIterable, TwitterAPIQueryParameterKeyProtocol, TwitterAPIQueryParameterValueProtocol, TwitterAPIQueryParameterProtocol {
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
//                case non_public_metrics
        case public_metrics
//                case organic_metrics
//                case promoted_metrics
        case possibly_sensitive
        case referenced_tweets
        case reply_settings
        case source
        case text
        case withheld
        
        static var parameterKey: String { return "tweet.fields" }
        
        var parameterValue: String { return self.rawValue }
    }
    enum UserField: String, CaseIterable, TwitterAPIQueryParameterKeyProtocol, TwitterAPIQueryParameterValueProtocol, TwitterAPIQueryParameterProtocol {
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
        
        static var parameterKey: String { return "user.fields" }
        
        var parameterValue: String { return self.rawValue }
    }
    enum UserTimeLine: TwitterAPIQueryParameterProtocol {
        case end_time(End_Time)
        case exclude([Exclude])
        case max_results(Max_Results)
        case paginationToken(PaginationToken)
        case since_id(SinceID)
        case start_time(StartTime)
        case until_id(UntilID)
        
        enum End_Time: TwitterAPIQueryParameterKeyProtocol, TwitterAPIQueryParameterValueProtocol, TwitterAPIQueryParameterProtocol {
            case custom(Date)
            
            static var keyString: String { return "tweet.fields" }
            
            static var parameterKey: String {
                return "end_time"
            }
            
            var parameterValue: String {
                switch self {
                case .custom(let date):
                    return String(date.timeIntervalSince1970)
                }
            }
            
        }
        enum Exclude: String, TwitterAPIQueryParameterKeyProtocol, TwitterAPIQueryParameterValueProtocol, TwitterAPIQueryParameterProtocol {
            case retweets
            case replies
            
            static var parameterKey: String {
                return "exclude"
            }
            
            var parameterValue: String {
                return self.rawValue
            }
        }
        enum Max_Results: TwitterAPIQueryParameterKeyProtocol, TwitterAPIQueryParameterValueProtocol, TwitterAPIQueryParameterProtocol {
            case custom(Int)
            
            static var parameterKey: String {
                return "end_time"
            }
            
            var parameterValue: String {
                switch self {
                case .custom(let int):
                    return String(int)
                }
            }
        }
        enum PaginationToken: TwitterAPIQueryParameterKeyProtocol, TwitterAPIQueryParameterValueProtocol, TwitterAPIQueryParameterProtocol {
            case custom(Int)

            static var parameterKey: String { return "end_time" }
            
            var parameterValue: String {
                switch self {
                case .custom(let int):
                    return String(int)
                }
            }
        }
        enum SinceID: TwitterAPIQueryParameterKeyProtocol, TwitterAPIQueryParameterValueProtocol, TwitterAPIQueryParameterProtocol {
            case custom(Int)
            
            static var parameterKey: String { return "end_time" }
            
            var parameterValue: String {
                switch self {
                case .custom(let int):
                    return String(int)
                }
            }
        }
        enum StartTime: TwitterAPIQueryParameterKeyProtocol, TwitterAPIQueryParameterValueProtocol, TwitterAPIQueryParameterProtocol {
            case custom(Date)

            static var parameterKey: String { return "end_time" }
            
            var parameterValue: String {
                switch self {
                case .custom(let date):
                    return String(date.timeIntervalSince1970)
                }
            }
        }
        enum UntilID: TwitterAPIQueryParameterKeyProtocol, TwitterAPIQueryParameterValueProtocol, TwitterAPIQueryParameterProtocol {
            case custom(String)
            
            static var parameterKey: String {
                return "end_time"
            }
            
            var parameterValue: String {
                switch self {
                case .custom(let string):
                    return string
                }
            }
        }
        
        static func parameter(from values: [QueryParameter.UserTimeLine]) -> String {
            var string: String = ""
            
            for parameter in values {
                switch parameter {
                case .end_time(let value):
                    string += End_Time.valueString(values: [value])
                case .exclude(let values):
                    string += Exclude.valueString(values: values)
                case .max_results(let value):
                    string += Max_Results.valueString(values: [value])
                case .paginationToken(let value):
                    string += PaginationToken.valueString(values: [value])
                case .since_id(let value):
                    string += SinceID.valueString(values: [value])
                case .start_time(let value):
                    string += StartTime.valueString(values: [value])
                case .until_id(let value):
                    string += UntilID.valueString(values: [value])
                }
            }
            
            return string
        }
    }
}
