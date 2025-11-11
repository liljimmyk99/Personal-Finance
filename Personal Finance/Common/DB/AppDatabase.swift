//
//  AppDatabase.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/20/25.
//
import Foundation
import GRDB
import os.log

// Credit to [GRDB Demo app](https://github.com/groue/GRDB.swift/tree/master/Documentation/DemoApps) as I followed their example set up with minor tweeks
struct AppDatabase: Sendable {
    /// Access to the database.
    let dbWriter: any DatabaseWriter

    /// Provides a read-only access to the database.
    var reader: any GRDB.DatabaseReader {
        dbWriter
    }

    /// Creates a `AppDatabase`, and makes sure the database schema
    /// is ready.
    ///
    init(_ dbWriter: any GRDB.DatabaseWriter) throws {
        self.dbWriter = dbWriter
        try migrator.migrate(dbWriter)
    }

    /// The DatabaseMigrator that defines the database schema.
    private var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()

        #if DEBUG
            migrator.eraseDatabaseOnSchemaChange = true
        #endif

        migrator.registerMigration("v1") { db in
            // Create a table
            try db.create(table: "user") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("firstName", .text).notNull()
                t.column("lastName", .text).notNull()
                t.column("email", .text).notNull()
                t.column("phoneNumber", .text).notNull()
                t.column("passwordHash", .text).notNull()
            }

            try db.create(table: "income") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("userID", .integer).references("user", onDelete: .cascade).notNull()
                t.column("date", .date).notNull()
                t.column("source", .text).notNull()
                t.column("gross_amount", .numeric).notNull()
                t.column("gross_taxable_amount", .numeric).notNull()
                t.column("net_amount", .numeric).notNull()
                t.column("lastUpdated", .date).notNull()
            }

            try db.create(table: "transaction") { t in
                t.autoIncrementedPrimaryKey("id")
                t.column("userID", .integer).references("user", onDelete: .cascade).notNull()
                t.column("date", .date).notNull()
                t.column("store", .text).notNull()
                t.column("amount", .numeric).notNull()
                t.column("category", .text).notNull()
                t.column("description", .text)
                t.column("lastUpdated", .date).notNull()
            }
        }

        return migrator
    }

    static func empty() -> AppDatabase {
        let dbQueue = try! DatabaseQueue(configuration: AppDatabase.makeConfiguration())
        return try! AppDatabase(dbQueue)
    }
}

// MARK: - Database Configuration

extension AppDatabase {
    // Uncomment for enabling SQL logging
    private static let sqlLogger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "SQL")

    /// Returns a database configuration suited for `AppDatabase`.
    ///
    /// - parameter config: A base configuration.
    static func makeConfiguration(_ config: Configuration = Configuration()) -> Configuration {
        var config = config

        if ProcessInfo.processInfo.environment["SQL_TRACE"] != nil {
            config.prepareDatabase { db in
                let dbName = db.description
                db.trace { event in
                    sqlLogger.debug("\(dbName): \(event)")
                }
            }
        }
        #if DEBUG
            // Protect sensitive information by enabling verbose debugging in
            config.publicStatementArguments = true
        #endif

        return config
    }
}

extension AppDatabase {
    static let shared = makeShared()

    private static func makeShared() -> AppDatabase {
        do {
            // Create the "Application Support/Database" directory if needed
            let fileManager = FileManager.default
            let appSupportURL = try fileManager.url(
                for: .applicationSupportDirectory, in: .userDomainMask,
                appropriateFor: nil, create: true
            )
            let directoryURL = appSupportURL.appendingPathComponent("Database", isDirectory: true)
            try fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true)

            // Open or create the database
            let databaseURL = directoryURL.appendingPathComponent("db.sqlite")
            let config = AppDatabase.makeConfiguration()
            let dbPool = try DatabasePool(path: databaseURL.path, configuration: config)

            // Create the AppDatabase
            let appDatabase = try AppDatabase(dbPool)

            return appDatabase
        } catch {
            fatalError("Unresolved error with database setup: \(error)")
        }
    }
}
