//
//  TwitterAPIQueryParameterProtocols.swift
//  TwitterCloneSaga
//
//  Created by Alfredo Colon on 4/8/22.
//

import Foundation

protocol TwitterAPIQueryParameterKeyProtocol {
    static var parameterKey: String { get }
}

protocol TwitterAPIQueryParameterValueProtocol {
    var parameterValue: String { get }
}

protocol TwitterAPIQueryParameterProtocol {
    static func parameter(from values: [Self]) -> String
}

extension TwitterAPIQueryParameterProtocol {
    static func valueString(values: [TwitterAPIQueryParameterValueProtocol]) -> String {
        return values.map { $0.parameterValue }.joined(separator: ",")
    }
}

extension TwitterAPIQueryParameterProtocol where Self: TwitterAPIQueryParameterValueProtocol & TwitterAPIQueryParameterKeyProtocol {
    static func parameter(from values: [Self]) -> String {
        return "&" + Self.parameterKey + "=" + self.valueString(values: values)
    }
}
