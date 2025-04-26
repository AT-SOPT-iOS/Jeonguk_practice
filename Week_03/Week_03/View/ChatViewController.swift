//
//  ChatViewController.swift
//  Week_03
//
//  Created by 정정욱 on 4/26/25.
//

import UIKit

import SnapKit
import Then

class ChatViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let chatList = ChatModel.dummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setLayout()
        register()
        setDelegate()
    }
    
    func setLayout() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    private func register() {
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
    }
    
}

//MARK: - Delegate

extension ChatViewController {
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

//MARK: - TableView

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        cell.dataBind(chatList[indexPath.row])
        return cell
    }
}

