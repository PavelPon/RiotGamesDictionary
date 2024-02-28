//
//  PlayerDatabase.swift
//  RiotGamesDictionary
//
//  Created by Pavel Ponomarev on 28.02.2024.
//

import Foundation
import SwiftData
import Dependencies

extension DependencyValues {
    var swiftData: PlayerDatabase {
        get { self[PlayerDatabase.self] }
        set { self[PlayerDatabase.self] = newValue }
    }
}

struct PlayerDatabase {
    var fetchAll: @Sendable () throws -> [Player]
    var fetch: @Sendable (FetchDescriptor<Player>) throws -> [Player]
    var add: @Sendable (Player) throws -> Void
    var delete: @Sendable (Player) throws -> Void
    
    enum PlayerError: Error {
        case add
        case delete
    }
}

extension PlayerDatabase: DependencyKey {
    public static let liveValue = Self(
        fetchAll: {
            do {
                @Dependency(\.databaseService.context) var context
                let movieContext = try context()
                
                let descriptor = FetchDescriptor<Player>(sortBy: [SortDescriptor(\.name)])
                return try movieContext.fetch(descriptor)
            } catch {
                return []
            }
        },
        fetch: { descriptor in
            do {
                @Dependency(\.databaseService.context) var context
                let movieContext = try context()
                return try movieContext.fetch(descriptor)
            } catch {
                return []
            }
        },
        add: { model in
            do {
                @Dependency(\.databaseService.context) var context
                let movieContext = try context()
                
                movieContext.insert(model)
            } catch {
                throw PlayerError.add
            }
        },
        delete: { model in
            do {
                @Dependency(\.databaseService.context) var context
                let movieContext = try context()
                
                let modelToBeDelete = model
                movieContext.delete(modelToBeDelete)
            } catch {
                throw PlayerError.delete
            }
        }
    )
}

extension PlayerDatabase: TestDependencyKey {
    public static var previewValue = Self.noop
    
    public static let testValue = Self(
        fetchAll: unimplemented("\(Self.self).fetch"),
        fetch: unimplemented("\(Self.self).fetchDescriptor"),
        add: unimplemented("\(Self.self).add"),
        delete: unimplemented("\(Self.self).delete")
    )
    
    static let noop = Self(
        fetchAll: { [] },
        fetch: { _ in [] },
        add: { _ in },
        delete: { _ in }
    )
}
