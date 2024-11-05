//
//  ZLMyViewController.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/6.
//

import UIKit

class ZLMyViewController: ZLBaseViewController {

    let viewModel = ZLMyViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func initUI() {
        super.initUI()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getUserInfo()
        getInfoByRole()
    }

    func getUserInfo() {
        viewModel.getUserInfo().subscribe { bool in

        }.disposed(by: rx.disposeBag)
    }

    func getInfoByRole() {
        viewModel.getInfoByRole().subscribe { bool in

        }.disposed(by: rx.disposeBag)
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
