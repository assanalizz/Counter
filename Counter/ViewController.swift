
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!

    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        counterLabel.text = "Значение счётчика: 0"
        historyTextView.text = "История изменений:"
    }

    func currentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter.string(from: Date())
    }

    func addHistory(_ text: String) {
        historyTextView.text += "\n[\(currentDate())]: \(text)"
    }

    @IBAction func plusTapped(_ sender: UIButton) {
        counter += 1
        counterLabel.text = "Значение счётчика: \(counter)"
        addHistory("значение изменено на +1")
    }

    @IBAction func minusTapped(_ sender: UIButton) {
        if counter > 0 {
            counter -= 1
            counterLabel.text = "Значение счётчика: \(counter)"
            addHistory("значение изменено на -1")
        } else {
            addHistory("попытка уменьшить значение счётчика ниже 0")
        }
    }

    @IBAction func resetTapped(_ sender: UIButton) {
        counter = 0
        counterLabel.text = "Значение счётчика: \(counter)"
        addHistory("значение сброшено")
    }
}
