//
//  ListOptionsViewController.swift
//  SampleApp
//
//  Created by admin on 18/03/23.
//

import UIKit

class ListOptionsViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    var rows: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }

    func getViewController(indexPath: IndexPath) -> UIViewController {
        .init()
    }
}

extension ListOptionsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.textLabel?.text = rows[indexPath.row]
        return cell
    }
}

extension ListOptionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = getViewController(indexPath: indexPath)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
