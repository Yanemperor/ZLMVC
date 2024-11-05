//
//  ZLBaseViewController.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/6.
//

import UIKit

class ZLBaseViewController: UIViewController {

    var navigator = ZLNavigator.shared
    var context: [String: Any] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        extendedLayoutIncludesOpaqueBars = true
        // Do any additional setup after loading the view.
        initUI()
    }

    func initUI() {
        view.theme_backgroundColor = .bg
        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    lazy var contentView: UIView = {
        let temp = UIView()
        temp.theme_backgroundColor = .bg
        return temp
    }()


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
