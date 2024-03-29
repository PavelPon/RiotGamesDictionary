//
// ImageObj.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ImageObj: Codable, JSONEncodable, Hashable {

    public var full: String
    public var sprite: String
    public var group: String
    public var x: Double
    public var y: Double
    public var w: Double
    public var h: Double

    public init(full: String, sprite: String, group: String, x: Double, y: Double, w: Double, h: Double) {
        self.full = full
        self.sprite = sprite
        self.group = group
        self.x = x
        self.y = y
        self.w = w
        self.h = h
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case full
        case sprite
        case group
        case x
        case y
        case w
        case h
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(full, forKey: .full)
        try container.encode(sprite, forKey: .sprite)
        try container.encode(group, forKey: .group)
        try container.encode(x, forKey: .x)
        try container.encode(y, forKey: .y)
        try container.encode(w, forKey: .w)
        try container.encode(h, forKey: .h)
    }
}

