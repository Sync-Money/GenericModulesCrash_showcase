
import UIKit
import ModuleGenericServices

public class DummyModuleCell: UITableViewCell {
    @IBOutlet weak var aButton: UIButton!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

// MARK: - ConfigurableCell
extension DummyModuleCell: ConfigurableCell {
    public func configure(decorator: DummyModuleDecorator) {
        aButton.backgroundColor = decorator.backgroundColor
    }
}
