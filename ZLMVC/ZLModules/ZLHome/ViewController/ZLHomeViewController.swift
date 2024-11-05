//
//  ZLHomeViewController.swift
//  ZLMVC
//
//  Created by Zilong.Zhou on 2024/6/6.
//

import UIKit

class ZLHomeViewController: ZLTableViewController {

    let viewModel = ZLHomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension ZLHomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = viewModel.items[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            navigator.show(segue: .login, sender: self, transition: .navigation)
        case 1:
            navigator.show(segue: .homeNoLogin, sender: self, transition: .navigation)
        case 2:
            let callback = PublishRelay<Void>()
            callback.subscribe { _ in
                print("callback")
            }.disposed(by: rx.disposeBag)
            navigator.show(segue: .homeDetail, sender: self, context: ["a": "1", "b": callback], transition: .navigation)
        default:
            break
        }
    }
}
