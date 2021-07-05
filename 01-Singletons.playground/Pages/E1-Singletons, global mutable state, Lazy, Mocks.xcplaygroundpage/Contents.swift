//: [Previous](@previous)

import Foundation
import UIKit

//class Media {
//    lazy let video = VideoPlayer()
//    lazy let audio = AudioPlayer()
//}
//
//let mediaPlayer = Media()
//
//mediaPlayer.audio.play()
//
//mediaPlayer.video.play()

struct User {
    let name: String
}

class ApiClient {
    static let shared = ApiClient()
    static private(set) var counter = 200
    init() {}
    
    func isPlayingVideo() -> Bool { return false }
    
    func login(user: User, completion: (User)->Void ) {
        completion(user)
    }
}

let unamedFunction: (User) -> Void = { (user: User) in
    print("user: \(user.name)")
}

class ViewController: UIViewController {
    var api:ApiClient = ApiClient.shared
    var loginClosure = unamedFunction
    
    func didTapLoginButton(user: User) {
        api.login(user: user, completion: loginClosure)
    }
}

let viewController = ViewController()
//viewController.api = MockApiClient()
let michael = User(name: "Michael")
let andres = User(name: "Andres")

viewController.didTapLoginButton(user: michael)
viewController.didTapLoginButton(user: andres)

//ApiClient.shared.login(user: <#User#>) { (user) in
//    //
//}

class MockApiClient: ApiClient {
    override init() {}

    override func login(user: User, completion: (User)->Void ) {
        let user = User(name: "Mock User")
        completion(user)
    }
}

viewController.api = MockApiClient()
viewController.didTapLoginButton(user: michael)

//class ApiClientColors: ApiClient {
//    static let sharedColors = ApiClientColors()
//    private init() {
//        print("Hola mis Espartanos")
//    }
//    override func isPlayingVideo() -> Bool { return true }
//}

extension ApiClient {
    func isDarkMode() -> Bool { return true }
}

let apiClient = ApiClient.shared

//ApiClient.counter = 1000
//ApiClient.counter = 1

print(ApiClient.counter)

let apiClient2 = ApiClient.shared
let api1 = ApiClient()
let api2 = ApiClient()
let api3 = ApiClient()

//identity operator
apiClient === apiClient2  ? true : false
api1 === api2 ? true : false

let url1 = URLSession()
let url2 = URLSession.shared

url2 === url1 ? true : false


ApiClient.shared.isPlayingVideo()
//ApiClientColors.sharedColors.isPlayingVideo()

//if ApiClient.shared.isPlayingVideo() {
////    player.stopPlaying()
//}

//ApiClient.shared.isDarkMode()
//ApiClientColors().isDarkMode()

//if () {
//
//}

//: [Next](@next)
