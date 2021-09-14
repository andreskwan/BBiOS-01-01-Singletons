//: [Previous](@previous)

import Foundation

public struct FeedItem: Equatable {
    public let id: UUID
    public let description: String?
    public let location: String?
    public let imageURL: URL
    
    public init(id: UUID, description: String?, location: String?, imageURL: URL) {
        self.id = id
        self.description = description
        self.location = location
        self.imageURL = imageURL
    }
}

internal class FeedItemsMapper {
    private static var OK_2000 = 0
    
//    private static let OK_200 = 0
    
    static var OK_200: Int {
        OK_2000 = Self.increment()
        return OK_2000
    }
    
    static func increment() -> Int {
        return Self.OK_2000 + 1
    }
    
    private struct Root: Decodable {
        let items: [Item]
    }
    
    private struct Item: Decodable {
        let id: UUID
        let description: String?
        let location: String?
        let image: URL
        
        var item: FeedItem {
            return FeedItem(id: id, description: description, location: location, imageURL: image)
        }
    }
    
//    private deinit() {
//
//    }
    
    
//    internal static func map(_ data: Data, _ response: HTTPURLResponse) throws -> [FeedItem] {
//        guard response.statusCode == OK_200 else {
//            throw RemoteFeedLoader.Error.invalidData
//        }
//
//        let root = try JSONDecoder().decode(Root.self, from: data)
//        return root.items.map { $0.item }
//    }
}

FeedItemsMapper.OK_200
FeedItemsMapper.OK_200
FeedItemsMapper.OK_200



//: [Next](@next)
