//: [Previous](@previous)

import Foundation



//MARK: No needed
protocol AnotherProtocol {
    func getFeed() -> [Feed]
}

protocol FeedLoaderMock {
    func getFeed() -> [Feed]
}

//MARK: Feed Feature
struct Feed {}

protocol FeedLoader {
    func getFeed() -> [Feed]
}

class LocalFeedLoaderMock: FeedLoader {
    func getFeed() -> [Feed] {
        return [Feed]()
    }
}

class RemoteFeedLoaderMock: FeedLoader {
    func getFeed() -> [Feed] {
        return [Feed]()
    }
}

class RemoteFeedLoader: FeedLoader {
    func getFeed() -> [Feed] {
        //API get data from a service
        return [Feed]()
    }
}

class LocalFeedLoader: FeedLoader {
    //get data from a database
    func getFeed() -> [Feed] {
        return [Feed]()
    }
}

//composer
class Main {
    var remoteFeedLoader: FeedLoader = RemoteFeedLoader()
    var localFeedLoader: FeedLoader = LocalFeedLoader()
    
    var anotherThing: AnotherProtocol!
    
    init() { }
    
    init(remote: FeedLoader, local : FeedLoader ){
        self.remoteFeedLoader = remote
        self.localFeedLoader = local
    }
}

let main = Main(remote : RemoteFeedLoaderMock(),local : LocalFeedLoaderMock())

extension Main: AnotherProtocol {
    
}

extension Main: FeedLoader {
    func getFeed() -> [Feed] {
        if false {
            return remoteFeedLoader.getFeed()
        }
        return localFeedLoader.getFeed()
    }
}

//MARK: UIKit
class ViewController {
    init() {
        print("we are in the ViewController Class initializer")
    }
}

//MARK: UI
class FeedViewController: ViewController {
    var feedLoader: FeedLoader!
    
    override init(){
        super.init()
        print("we are in the FeedViewController init")
    }
    
    convenience init(feedLoader: FeedLoader) {
        self.init()
        print("we are in the convenience init of FeedViewController")
        self.feedLoader = feedLoader
    }
}

let feedVC = FeedViewController(feedLoader: main)

//: [Next](@next)
