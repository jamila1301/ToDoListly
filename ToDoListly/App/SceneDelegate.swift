import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let hasSeenOnboarding = UserDefaults.standard.bool(forKey: "hasSeenOnboarding")
        
        if !hasSeenOnboarding {
            let onboardingVC = OnboardingViewController()
            onboardingVC.onFinish = {
                UserDefaults.standard.set(true, forKey: "hasSeenOnboarding")
                let loginVC = LoginViewController()
                loginVC.modalPresentationStyle = .fullScreen
                window.rootViewController = loginVC
            }
            window.rootViewController = onboardingVC
        } else {
            if let currentUser = Auth.auth().currentUser {
                let homeVC = HomeViewController(userId: currentUser.uid)
                window.rootViewController = homeVC
            } else {
                let loginVC = LoginViewController()
                window.rootViewController = loginVC
            }
        }
        
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}
