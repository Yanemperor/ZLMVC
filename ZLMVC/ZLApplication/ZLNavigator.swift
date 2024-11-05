//
//  ZLNavigator.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/12.
//

import UIKit
import SafariServices

class ZLNavigator: NSObject {
    static var shared = ZLNavigator()

    enum Scene: Equatable {
        case home
        case server
        case my
        case login
        case homeDetail
        case homeNoLogin

        case safari(URL)
        case safariController(URL)
    }

    // 需要登录的页面
    let logins: [Scene] = [.homeDetail]

    enum Transition {
        case root(in: UIWindow)
        case navigation
    }

    func get(segue: Scene) -> UIViewController? {
        switch segue {
        case .home:
            return ZLHomeViewController()
        case .server:
            return ZLServerViewController()
        case .my:
            return ZLMyViewController()
        case .login:
            return ZLLoginViewController()
        case .homeDetail:
            return ZLHomeDetailViewController()
        case .homeNoLogin:
            return ZLHomeNoLoginDetailViewController()
            
        case .safari(let url):
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            return nil
        case .safariController(let url):
            let vc = SFSafariViewController(url: url)
            return vc
        }
    }

    func pop(sender: UIViewController?, toRoot: Bool = false) {
        if toRoot {
            sender?.navigationController?.popToRootViewController(animated: true)
        } else {
            sender?.navigationController?.popViewController()
        }
    }

    // pop到指定控制器
    func pop(sender: UIViewController?, toSender: UIViewController) {
        if let navigationController = sender?.navigationController {
            for subViewController in navigationController.viewControllers.reversed() {
                if type(of: subViewController) == type(of: toSender) {
                    navigationController.popToViewController(subViewController, animated: true)
                }
            }
        }
    }

    func dismiss(sender: UIViewController?) {
        sender?.dismiss(animated: true, completion: nil)
    }

    func isLogin(segue: Scene) -> Bool {
        let isLogin = logins.contains {
            return $0 == segue
        }
        guard isLogin && !ZLAuthManager.shared.hasValidToken else {
            return false
        }
        return true
    }

    func show(segue: Scene, sender: UIViewController?, context: [String: Any] = [:], transition: Transition) {
        var segue = segue
        if isLogin(segue: segue) {
            segue = .login
        }
        guard let target = get(segue: segue) else { return }

        if target is ZLBaseViewController {
            let target = target as? ZLBaseViewController
            target!.context = context
        }
        show(target: target, sender: sender, transition: transition)
    }

    private func show(target: UIViewController, sender: UIViewController?, transition: Transition) {
        switch transition {
        case .root(in: let window):
            window.rootViewController = target
            window.makeKeyAndVisible()
            return
        default:
            break
        }

        guard let sender = sender else {
            fatalError("You need to pass in a sender for .navigation or .modal transitions")
        }

        if let nav = sender as? UINavigationController {
            nav.pushViewController(target, animated: false)
            return
        }

        switch transition {
        case .navigation:
            if let nav = sender.navigationController {
                nav.pushViewController(target, animated: true)
            }
        default:
            break
        }
    }
}
