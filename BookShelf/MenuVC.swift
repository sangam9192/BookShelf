import Foundation

class MenuVC: UITableViewController{

    var tableArray = [String]()
    var sectionArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableArray = ["1","2","3"]
        sectionArray = ["Categories"]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArray.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionArray[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = tableArray[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "filter"{
            let vc = segue.destination as! HomeVC
            vc.string = tableArray[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    
}
