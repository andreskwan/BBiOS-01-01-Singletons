import UIKit

final class AppState {
    static let sharedInstance = AppState()
    
    private init() { }
}

let appState = AppState.sharedInstance
//I can't instantiate a singleton
//let appState2 = AppState()

//Extensions are allowed on final classes!!!
extension AppState {
    func addition(_ a: Int, _ b: Int) -> Int {
        a + b
    }
}

appState.addition(3, 7)


