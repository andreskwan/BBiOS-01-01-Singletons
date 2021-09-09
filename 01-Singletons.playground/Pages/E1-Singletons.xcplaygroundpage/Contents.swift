import UIKit

struct LoggedInUser {}
//Sigleton
class ApiClient {
    static let sharedInstance = ApiClient()
    
    private init() { }
}

protocol Login {
    func login(completion: (LoggedInUser) -> Void)
}

extension ApiClient: Login {
    func login(completion: (LoggedInUser) -> Void) {}
}

let api = ApiClient.sharedInstance
//I can't instantiate a singleton
//let api2 = ApiClient()

//Extensions are allowed on final classes!!!
extension ApiClient {
    func addition(_ a: Int, _ b: Int) -> Int {
        a + b
    }
}

api.addition(3, 7)

class MockApiClient: ApiClient {}

//How to write test code that involve Singletons
class LoginViewController: UIViewController {
    var api: Login!
    
    init(api: Login) {
        self.api = api
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func didTapLoginButton() {
        //trailling closure
        let value: () = api.login { user in }
        
        print("value: \(value)")
    }
}

//this is production code
LoginViewController(api: ApiClient.sharedInstance)
//this is for tests
LoginViewController(api: MockApiClient.sharedInstance)

struct Follower {}

protocol Followers {
    func loadFollowers(completion: ([Follower]) -> Void)
}

extension ApiClient: Followers {
    func loadFollowers(completion: ([Follower]) -> Void) {}
}

class FeedViewController: UIViewController {
    var api: Followers!
    
    init(api: Followers) {
        self.api = api
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func didTapLoginButton() {
        api.loadFollowers { followers in
            
        }
    }
}


