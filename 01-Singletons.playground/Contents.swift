import UIKit

struct LoggedInUser {}
//Sigleton
final class AppState {
    static let sharedInstance = AppState()
    
    private init() { }
    
    func login(completion: (LoggedInUser) -> Void) {}
}
protocol Logger {
    func login(completion: (LoggedInUser) -> Void)
}

extension AppState: Logger {}

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

//How to write test code that involve Singletons
class LoginViewController: UIViewController {
    let state: Logger!
    
    init(state: Logger) {
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func didTapLoginButton() {
        state.login() { user in
            //show next screen
        }
    }
}

