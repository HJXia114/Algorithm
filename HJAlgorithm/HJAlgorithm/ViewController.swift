//
//  ViewController.swift
//  HJAlgorithm
//
//  Created by 夏航军(lu.com) on 2022/11/17.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    private let itemReuseId = "item_reuse_identifier"
    var items: [AlgorithmType] = AlgorithmType.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Algorithm"
        self.tableView.frame = self.view.bounds
        self.view.addSubview(self.tableView)
        
    }

    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: self.view.bounds, style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.alwaysBounceVertical = true
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.rowHeight = 50
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0.01))
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0.01))

        if #available(iOS 11, *) {
            tableView.contentInsetAdjustmentBehavior = .never
            tableView.estimatedRowHeight = 0
            tableView.estimatedSectionFooterHeight = 0
            tableView.estimatedSectionHeaderHeight = 0
        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: itemReuseId)
        return tableView
    }()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: itemReuseId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: itemReuseId)
        }
        cell?.selectionStyle = .none
        cell?.textLabel?.text = items[indexPath.row].description
        return cell!
    }

    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(items[indexPath.row].viewController, animated: true)
    }

}

