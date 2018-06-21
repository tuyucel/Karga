import UIKit
import Firebase

class ViewControllerSignUp: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    var alert = UIAlertController()
    var handle:AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signUp(_ sender: Any) {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) {(user,error) in
            if Auth.auth().currentUser != nil {
                self.alert = UIAlertController(title: "Hoşgeldiniz", message: "Kayıt Başarılı", preferredStyle: .alert)
                let devam = UIAlertAction(title: "Devam et", style: .default) { (action:UIAlertAction!) in}
                self.performSegue(withIdentifier: "nextHome", sender: nil)
                self.alert.addAction(devam)
                self.present(self.alert, animated: true, completion: nil)
                
            }else{
            self.alert = UIAlertController(title: "Kayıt Başarısız", message: "Email veya şifreyi kontrol ediniz", preferredStyle: .alert)
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
