import UIKit
import Firebase

class SecondViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var cargoList = [cargoDB]()
    var refCargo: DatabaseReference!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  cargoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let cargo: cargoDB
        cargo = cargoList[indexPath.row]
        cell.cargoID.text = cargo.id
        cell.cargoInfo.text = cargo.state
        
        return cell
    }
  
    @IBAction func exitBtn(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            dismiss(animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    @IBOutlet weak var tabloGoster: UITableView!
    var refHandle: UInt!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refCargo = Database.database().reference().child("cargos");

        refCargo.observe(DataEventType.value, with: { (snapshot) in
            _ = snapshot.value as? [String : AnyObject] ?? [:]
            if snapshot.childrenCount > 0 {
                //self.cargoList.removeAll()
                print(snapshot.children.allObjects)
                
                for cargos in snapshot.children.allObjects as! [DataSnapshot]{
                
                    let cargoObject = cargos.value as? [String: AnyObject]
                    let cargoId = cargoObject?["id"]
                    let cargoState = cargoObject?["statu"]
                    
                    let cargo = cargoDB(id: cargoId as! String?, state: cargoState as! String?)
                    
                    self.cargoList.append(cargo)
                }
                self.tabloGoster.reloadData()
            }
        })
        
        }
    
    
    }
