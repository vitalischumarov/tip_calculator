import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var result: String = "0.0"
    var person: String = "0.0"
    var tip: String = "0.0"
    
    @IBOutlet weak var message: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = String(result)
        message.text = "Split between \(person) people, with \(tip)% tip."
    }
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
