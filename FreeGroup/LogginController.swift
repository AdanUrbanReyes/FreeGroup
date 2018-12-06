import UIKit

class LogginController: UIViewController {

    @IBOutlet weak var userEmail_tf: UITextField!
    @IBOutlet weak var password_tf: UITextField!
    @IBOutlet weak var messages_tv: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messages_tv.text = ""
        messages_tv.isEditable = false;
    }
    
    
    public func missingAttributes() -> String{
        if(userEmail_tf.text == ""){
            return "Por favor ingrese su \(userEmail_tf.placeholder!)"
        }else if (password_tf.text == ""){
            return "Por favor ingrese su \(password_tf.placeholder!)"
        }
        return ""
    }
    
    @IBAction func send_touchUpInside(_ sender: UIButton) {
        let ma : String = missingAttributes()
        if(ma != ""){
            messages_tv.text = ma
        }else{
            messages_tv.text = "El usuario \(userEmail_tf.text!) no esta registrado"
        }
    }
    
    @IBAction func socialNetwork_touchUpInside(_ sender: UIButton) {
        messages_tv.text = "Lo sentimos existen problemas de conexion."
    }
    
    
}
