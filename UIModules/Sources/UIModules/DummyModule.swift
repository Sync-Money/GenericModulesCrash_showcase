
import UIKit
import ModuleGenericServices

public class DummyModule: ConfigurableSingleClassRowModule<DummyModuleCell, DummyModuleDecorator> {    
    open override func registerViews() {
        [DummyModuleCell.self].forEach { currentClass in
            let identifier = String(describing: currentClass)
            let nib = UINib(nibName: identifier, bundle: Bundle.module)
            tableView.register(nib, forCellReuseIdentifier: identifier)
        }
    }
}
