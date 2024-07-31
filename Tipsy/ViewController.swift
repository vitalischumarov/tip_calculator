import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var choose_split_label: UILabel!
    @IBOutlet weak var zero_btn: UIButton!
    @IBOutlet weak var ten_btn: UIButton!
    @IBOutlet weak var twenty_btn: UIButton!
    @IBOutlet weak var amount_textfield: UITextField!
    
    
    var choosenSplit: Float = 2
    var choosenPercentage: Float = 0.1
    var amount: Float = 0
    var bill: Float = 0
    var pay_per_person: Float = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func click_stepper(_ sender: UIStepper) {
        choose_split_label.text = String(format: "%.0f", stepper.value)
        choosenSplit = Float(stepper.value)
    }
    
    @IBAction func button_selected(_ sender: UIButton) {
        switch sender.tag {
        case 0 :
                self.zero_btn.isSelected = true
                self.ten_btn.isSelected = false
                self.twenty_btn.isSelected = false
                choosenPercentage = 0
        case 1 :
                self.zero_btn.isSelected = false
                self.ten_btn.isSelected = true
                self.twenty_btn.isSelected = false
                choosenPercentage = 0.1
        case 2 :
                self.zero_btn.isSelected = false
                self.ten_btn.isSelected = false
                self.twenty_btn.isSelected = true
                choosenPercentage = 0.2
        default:
            print("nothing selecteds")
        }
    }
    
    @IBAction func press_calculate_btn(_ sender: UIButton) {
        if amount_textfield.text != "" {
            let input = amount_textfield.text!
            amount = Float(input)!
            pay_per_person = (amount + (amount * choosenPercentage)) / choosenSplit
            bill = amount + (amount * choosenPercentage)
            performSegue(withIdentifier: "goToSecondViewController", sender: self)
        } else {
            print("no amount")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToSecondViewController") {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.result = String(format: "%.2f",pay_per_person)
            destinationVC.person = String(format: "%.0f", choosenSplit)
            destinationVC.tip = String(format: "%.0f", choosenPercentage * 100)
        }
    }
}

