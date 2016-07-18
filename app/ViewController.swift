import UIKit

class ViewController: UIViewController {

    @IBOutlet var labelResult: UITextField!
    
    var result = Float()
    var currentNumber = Float()
    var currentOperation = String()
    var decimalPressed = false
    var decimalLength:Float = 10    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currentOperation = "="
        labelResult.text = ("\(result)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonNumberInput(sender: UIButton) {
        if  !decimalPressed{
            currentNumber = currentNumber * 10 + Float(Int(sender.titleLabel!.text!)!)
            labelResult.text = ("\(currentNumber)")
        }
        else {
            currentNumber = currentNumber + Float(Int(sender.titleLabel!.text!)!) / decimalLength
            labelResult.text = ("\(currentNumber)")
            decimalLength *= 10
        }
    }
    
    
    @IBAction func buttonOperation(sender: UIButton) {

        decimalPressed = false
        decimalLength = 10
        
        switch currentOperation{
            case "=":
                result = currentNumber
            case "+":
                result += currentNumber
            case "-":
                result -= currentNumber
            case "/":
                result /= currentNumber
            case "*":
                result *= currentNumber
            case "pow":
                result = pow(result, currentNumber)
            default:
                print("error")
        }
        
        currentNumber = 0
        labelResult.text = ("\(result)")
         
        if (sender.titleLabel!.text == "="){
            result = 0
        }
        
        currentOperation = sender.titleLabel!.text! as String!
    }
    
    @IBAction func buttonClear(sender: UIButton) {
        result = 0
        currentNumber = 0
        currentOperation = "="
        labelResult.text = ("\(result)")
        decimalPressed = false
        decimalLength = 10
    }
    
    @IBAction func buttonSqrt(sender: UIButton) {
        result = sqrt(result)
        labelResult.text = ("\(result)")
    }
    
    @IBAction func buttonSign(sender: UIButton) {
        result *= -1
        labelResult.text = ("\(result)")
    }

    @IBAction func buttonDecimal(sender: UIButton) {
        decimalPressed = true
    }
}

