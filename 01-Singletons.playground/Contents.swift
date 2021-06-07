import UIKit

struct LoggedInUser {}
//Sigleton
final class AppState {
    static let sharedInstance = AppState()
    
    private init() { }
    
    func login(completion: (LoggedInUser) -> Void) {}
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

//singleton
//URLSession.shared
//URLSession()

//How to write test code that involve Singletons
class LoginViewController: UIViewController {
    func didTapLoginButton() {
        AppState.sharedInstance.login() { user in
            //show next screen
        }
    }
}

