//
//  MessageThreadDetailTableViewController.swift
//  Message Board
//
//  Created by Mitchell Budge on 5/15/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit

class MessageThreadDetailTableViewController: UITableViewController {
    var messageThread: MessageThread?
    var messageThreadController: MessageThreadController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    } // end of view did load
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageThread?.messages.count ?? 0
    } // end of rows in section

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        let message = messageThread?.messages[indexPath.row]
        cell.textLabel?.text = message?.sender
        cell.detailTextLabel?.text = message?.text
        return cell
    } // end of cell for row at

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue" {
            let messageDVC = segue.destination as! MessageDetailViewController
            messageDVC.messageThreadController = messageThreadController
            messageDVC.messageThread = messageThread
        }
    } // end of segue
}
