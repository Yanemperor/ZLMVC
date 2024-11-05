//
//  ZLHomeDetailViewController.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/13.
//

import UIKit

class ZLHomeDetailViewController: ZLBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func initUI() {
        super.initUI()
        print(context["a"] ?? "")

        if let callback = context["b"] as? PublishRelay<Void> {
            callback.accept(())
        }
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
