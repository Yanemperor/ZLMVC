//
//  ZLNavigationController.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/6.
//

import UIKit

class ZLNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setNavBar()
        interactivePopGestureRecognizer?.delegate = nil
        navigationBar.isTranslucent = false
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count >= 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }

    func setNavBar() {
        let appearance = UINavigationBar.appearance()
        appearance.shadowImage = UIImage()
        // 导航条背景是否透明
        appearance.isTranslucent = false
        // 背景色，导航条背景色
        appearance.theme_barTintColor = .bg
        // 设置导航条标题颜色，还可以设置其它文字属性，只需要在里面添加对应的属性
        appearance.titleTextAttributes = [.foregroundColor: UIColor.head, .font: UIFont.autoBold(size: 18)]

        // 解决iOS15 barTintColor设置无效的问题，参考https://developer.apple.com/forums/thread/682420
        if #available(iOS 15.0, *) {
            let newAppearance = UINavigationBarAppearance()
            newAppearance.configureWithOpaqueBackground()
            newAppearance.theme_backgroundColor = .bg
            newAppearance.shadowImage = UIImage()
            newAppearance.shadowColor = nil
            newAppearance.titleTextAttributes = [.foregroundColor: UIColor.head, .font: UIFont.autoBold(size: 18)]
            appearance.standardAppearance = newAppearance
            appearance.scrollEdgeAppearance = appearance.standardAppearance
        }
    }
}
