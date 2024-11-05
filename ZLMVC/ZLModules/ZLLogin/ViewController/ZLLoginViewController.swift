//
//  ZLLoginViewController.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/7.
//

import UIKit

class ZLLoginViewController: ZLBaseViewController {

    let viewModel = ZLLoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()


        getInfoRoleByUserName()
        getCaptchaImage()

        // Do any additional setup after loading the view.
    }

    override func initUI() {
        super.initUI()
        contentView.addSubviews([captchaImageView, codeTextField, loginBtn, logoutBtn])
        captchaImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(auto(size: 10))
            make.size.equalTo(CGSize(width: auto(size: 80), height: auto(size: 40)))
            make.left.equalToSuperview().offset(auto(size: 20))
        }

        codeTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(auto(size: 10))
            make.size.equalTo(CGSize(width: auto(size: 80), height: auto(size: 40)))
            make.right.equalToSuperview().offset(auto(size: -20))
        }

        loginBtn.snp.makeConstraints { make in
            make.top.equalTo(captchaImageView.snp.bottom).offset(auto(size: 30))
            make.size.equalTo(CGSize(width: auto(size: 200), height: auto(size: 40)))
            make.centerX.equalToSuperview()
        }

        logoutBtn.snp.makeConstraints { make in
            make.top.equalTo(loginBtn.snp.bottom).offset(auto(size: 30))
            make.size.equalTo(CGSize(width: auto(size: 200), height: auto(size: 40)))
            make.centerX.equalToSuperview()
        }
        _ = codeTextField.rx.textInput <-> viewModel.imageCode
    }

    func getCaptchaImage() {
        viewModel.getCaptchaImage().subscribe { result in
            self.captchaImageView.image = self.viewModel.captchaImage
        }.disposed(by: rx.disposeBag)
    }

    func getInfoRoleByUserName() {
        viewModel.getInfoRoleByUserName().subscribe { result in

        }.disposed(by: rx.disposeBag)
    }

    func login() {
        viewModel.login().subscribe { result in
            if result {
                self.navigationController?.popViewController(animated: true)
            }
        }.disposed(by: rx.disposeBag)
    }

    func logout() {
        ZLAuthManager.shared.removeToken()
    }

    lazy var captchaImageView: UIImageView = {
        let temp = UIImageView.create(bgColor: .bg)
        temp.rx.tap().subscribe { _ in
            self.getCaptchaImage()
        }.disposed(by: rx.disposeBag)
        return temp
    }()

    lazy var codeTextField: UITextField = {
        let temp = UITextField.create()
        return temp
    }()

    lazy var loginBtn: UIButton = {
        let temp = UIButton.create(title: "登录")
        temp.rx.controlEvent(.touchUpInside).subscribe { (button) in
            self.login()
        }.disposed(by: rx.disposeBag)
        return temp
    }()

    lazy var logoutBtn: UIButton = {
        let temp = UIButton.create(title: "退出登录")
        temp.rx.controlEvent(.touchUpInside).subscribe { (button) in
            self.logout()
        }.disposed(by: rx.disposeBag)
        return temp
    }()



}
