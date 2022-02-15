import ModuleServices
import UIModules

class ViewController: ModulesViewController {
    override func createModules() {
        super.createModules()
        
        loadDummyModule()
    }
}

// MARK: - Private Methods
private extension ViewController {
    func loadDummyModule() {
        let module = DummyModule(tableView: tableView!)
        module.configure(decorator: DummyModuleDecorator())
        appendModule(module)
    }
}
