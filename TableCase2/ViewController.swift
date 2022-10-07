//
//  ViewController.swift
//  TableCase2
//
//  Created by Eunchan Kim on 2022/10/06.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    var list1 = ["공지사항", "실험실", "버전 정보"]
    var list2 = ["개인/보안", "알림", "채팅", "멀티프로필"]
    var list3 = ["고객센터/도움말"]
    
    var sections = ["전체 설정", "개인 설정", "기타"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib.init(nibName: "TableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "TableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // 섹션타이틀
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "\(sections[0])"
        }
        if section == 1 {
            return "\(sections[1])"
        } else {
            return "\(sections[2])"
        }
    }
    
    //셀 선택시 콘솔에 프린트
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            print(list1[indexPath.row])
        }
        if indexPath.section == 1 {
            print(list2[indexPath.row])
        }
        if indexPath.section == 2 {
            print(list3[indexPath.row])
        }
    }
    //섹션의 수는 변수 sections의 count
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    //셀의 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return list1.count
        }
        if section == 1 {
            return list2.count
        } else {
            return list3.count
        }
       
    }

    // 셀 레이블에 텍스트
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        if indexPath.section == 0 {
            cell.cellLabel.text = list1[indexPath.row]
        }
        if indexPath.section == 1 {
            cell.cellLabel.text = list2[indexPath.row]
        }
        if indexPath.section == 2 {
            cell.cellLabel.text = list3[indexPath.row]
        }
        return cell
    }
}

