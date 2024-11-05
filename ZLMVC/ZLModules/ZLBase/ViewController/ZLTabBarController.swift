//
//  ZLTabBarController.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/6.
//

import UIKit

enum ZLTabBarItem: Int {
    case home, server, my

    private func controller() -> UIViewController {
        switch self {
        case .home:
            let vc = ZLHomeViewController()
            return ZLNavigationController(rootViewController: vc)
        case .server:
            let vc = ZLServerViewController()
            return ZLNavigationController(rootViewController: vc)
        case .my:
            let vc = ZLMyViewController()
            return ZLNavigationController(rootViewController: vc)
        }
    }

    var image: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "tabbar_home_noraml")
        case .server:
            return UIImage(named: "tabbar_server_noraml")
        case .my:
            return UIImage(named: "tabbar_my_noraml")
        }
    }

    var selectedImage: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "tabbar_home_selected")
        case .server:
            return UIImage(named: "tabbar_server_selected")
        case .my:
            return UIImage(named: "tabbar_my_selected")
        }
    }

    var title: String {
        switch self {
        case .home:
            return "首页"
        case .server:
            return "服务"
        case .my:
            return "我的"
        }
    }

    func getController() -> UIViewController {
        let vc = controller()
        let item = UITabBarItem(title: title, image: image, selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        vc.tabBarItem = item
        return vc
    }
}

class ZLTabBarController: UITabBarController {

    let tabBarItems: [ZLTabBarItem] = [.home, .server, .my]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initUI()
    }

    func initUI() {
        tabBarController?.tabBar.isHidden = true
        tabBar.barTintColor = .white
        
        let appearance = UITabBarAppearance()
        appearance.theme_backgroundColor = .bg
        appearance.shadowImage = UIImage.color(color: .clear)
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.title]
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.text]
        tabBar.scrollEdgeAppearance = appearance
        tabBar.standardAppearance = appearance

        let controllers = tabBarItems.map {
            $0.getController()
        }
        self.setViewControllers(controllers, animated: false)
    }




    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
