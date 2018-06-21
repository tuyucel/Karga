import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    var alert = UIAlertController()
    var handle:AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if Auth.auth().currentUser != nil{
                print("Giriş başarılı")
                self.performSegue(withIdentifier: "nextPage", sender: nil)
            }else{
                print("Kullanıcı bulunamadı")
            }
    }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    @IBAction func signIn(_ sender: Any) {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if Auth.auth().currentUser != nil {
            self.alert = UIAlertController(title: "Hoşgeldiniz", message: "Giriş Başarılı", preferredStyle: .alert)
            self.performSegue(withIdentifier: "nextPage", sender: nil)
        } else {
            self.alert = UIAlertController(title: "Giriş Başarısız", message: "Email veya şifreyi kontrol ediniz", preferredStyle: .alert)
            let temizle = UIAlertAction(title: "Temizle", style: .cancel) { (action:UIAlertAction!) in
                
                self.email.text! = ""
                self.password.text! = ""
            }
            self.alert.addAction(temizle)
            let tamam = UIAlertAction(title: "Tekrar dene", style: .default) { (action:UIAlertAction!) in  }
            
            self.alert.addAction(tamam)
            
            self.present(self.alert, animated: true, completion:nil)
        }
    }
    }
}
