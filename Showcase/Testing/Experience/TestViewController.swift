import UIKit

class TestViewController: UIViewController {
    
    lazy var Label: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        view.addSubview(Label)
        
        NSLayoutConstraint.activate([
            Label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            Label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50),
        ])
      
    }
}
