import UIKit

class RegisterController: UIViewController {

    public let FULL_NAME_MINIMUM_CHARACTERS : Int = 3
    public let PASSWORD_MINIMUM_CHARACTERS : Int = 3
    public let DATE_FORMAT : String = "dd-MM-yyyy"
    
    @IBOutlet weak var fullName_tf: UITextField!
    @IBOutlet weak var phone_tf: UITextField!
    @IBOutlet weak var email_tf: UITextField!
    @IBOutlet weak var password_tf: UITextField!
    @IBOutlet weak var passwordConfirm_tf: UITextField!
    @IBOutlet weak var sex_tf: UITextField!
    @IBOutlet weak var birth_tf: UITextField!
    @IBOutlet weak var termsConditions_s: UISwitch!
    @IBOutlet weak var termsConditions_l: UILabel!
    @IBOutlet weak var messages_tv: UITextView!
    @IBOutlet weak var termsConditions_tv: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messages_tv.text = ""
        termsConditions_tv.isEditable = false;
        messages_tv.isEditable = false;
    }
    
    public func convertToDate(date : String) -> Bool{
        let df : DateFormatter = DateFormatter()
        df.dateFormat = DATE_FORMAT
        return (df.date(from: date) != nil)
    }
    
    public func missingAttributes() -> String{
        if(fullName_tf.text!.count < FULL_NAME_MINIMUM_CHARACTERS){
            return "Por favor ingrese al menos \(FULL_NAME_MINIMUM_CHARACTERS) caracteres para el campo \(fullName_tf.placeholder!)"
        }else if(phone_tf.text!.count > 0 && !CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: phone_tf.text!))){
            return "Por favor ingrese solo digitos en el campo \(phone_tf.placeholder!)"
        }else if(!email_tf.text!.contains("@")){
            return "Por favor ingrese un \(email_tf.placeholder!) valido"
        }else if(password_tf.text!.count < PASSWORD_MINIMUM_CHARACTERS){
            return "Por favor ingrese al menos \(PASSWORD_MINIMUM_CHARACTERS) caracteres para el campo \(password_tf.placeholder!)"
        }else if(password_tf.text! != passwordConfirm_tf.text!){
            return "El campo \(password_tf.placeholder!) no coincide con el campo \(passwordConfirm_tf.placeholder!) por favor revice"
        }else if(sex_tf.text! != "Masculino" && sex_tf.text! != "Femenino"){
            return "Los unicos valores posibles para el campo \(sex_tf.placeholder!) son Masculino ò Femenino"
        }else if(!convertToDate(date: birth_tf.text!)){
            return "Por favor ingrese una \(birth_tf.placeholder!) valida, con formato \(DATE_FORMAT)"
        }else if(!termsConditions_s.isOn){
            return "Por favor lea y acepte los terminos y condiciones"
        }
        
        return ""
    }
    
    public func cleanFields() -> Void{
        fullName_tf.text = ""
        phone_tf.text = ""
        email_tf.text = ""
        password_tf.text = ""
        passwordConfirm_tf.text = ""
        sex_tf.text = ""
        birth_tf.text = ""
    }
    @IBAction func termsConditions_valueChanged(_ sender: UISwitch) {
        termsConditions_l.text = (sender.isOn) ? "Acepto" : "NO Acepto"
    }
    
    @IBAction func send_touchUpInside(_ sender: UIButton) {
        let ma : String = missingAttributes()
        if(ma != ""){
            messages_tv.textColor = .red
            messages_tv.text = ma;
        }else{
            messages_tv.textColor = .green
            messages_tv.text = "FELIZIDADES TU REGISTRO A SIDO COMPLETADO"
            cleanFields()
        }
    }
    
}

