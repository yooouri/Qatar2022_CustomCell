//
//  ViewController.swift
//  Qatar2022_CustomCell
//
//  Created by yuri on 2022/10/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.rowHeight = 120
        tableView.dataSource = self
        tableView.delegate = self
    }


}


extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return nations.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keys = nations.keys.sorted()
        let key = keys[section]
        if let group = nations[key]{
            return group.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let keys = nations.keys.sorted()
        let key = keys[indexPath.section]
        
        guard let group = nations[key] else { fatalError() }
        let nation = group[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let flagImage = cell.viewWithTag(1) as? UIImageView
        flagImage?.image = UIImage(named: nation.flag)
        
        let nameLbl = cell.viewWithTag(2) as? UILabel
        nameLbl?.text = nation.name
        
        let groupLbl = cell.viewWithTag(3) as? UILabel
        groupLbl?.text = "Group \(nation.group)"
        
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        let keys = nations.keys.sorted()
        let key = keys[section]
        
        label.text = "Group \(key)"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        label.backgroundColor = .lightGray
        label.textColor = .white
        return label
    }
}
