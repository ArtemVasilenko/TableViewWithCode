
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var myTableView = UITableView()
    let indifiecator = "Cell"
    var array = ["1", "2", "3", "4", "5", "6", "7", "8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTableView()
    }
    
    func createTableView() {
        myTableView = UITableView(frame: self.view.bounds, style: .grouped)
        self.view.addSubview(myTableView)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: indifiecator)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 3
        case 1: return 5
        case 2: return array.count
        default: return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indifiecator, for: indexPath)
//        cell.textLabel?.text = "section = \(indexPath.section), cell = \(indexPath.row)"
        
        cell.textLabel?.text = array[indexPath.row]
        
        switch indexPath.section {
        case 0: cell.backgroundColor = .red
            cell.accessoryType = .checkmark
        case 1: cell.backgroundColor = .blue
            cell.accessoryType = .detailButton
        case 2: cell.backgroundColor = .green
            cell.accessoryType = .disclosureIndicator
        default: break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row, array[indexPath.row])
    }
    
}


