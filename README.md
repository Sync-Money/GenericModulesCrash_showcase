# Example project to showcase an issue with the ModuleServices package

There is an issue with `ModuleServices` when used with the following setup:

- Main app that use `ModuleServices`
- Local package that use `ModuleServices` and `ModuleGenericServices`
- Custom module created in the local package and imported in the main app

The issue arise with the auto Nib registration that we have for example here:

```
open class SingleClassCellRowsModule<Cell: ConfigurableCell, RowsDecorator: RowsDecoratorProtocol>: TableSectionModule {
    open override func registerNibsForCells() -> [AnyClass] {
        super.registerNibsForCells() + [
            Cell.classForCoder()
        ]
    }
```

This class override `registerNibsForCells` returning the class name of the cell associated.
The superclass use these class names to register the associated nib file

```
    fileprivate func autoRegisterNibsForCells() {
        registerNibsForCells().forEach { currentClass in
            let identifier = String(describing: currentClass)
            let nib = UINib(nibName: identifier, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: identifier)
        }
    }
```

The issue is with the bundle parameter, since there is hardcoded as `nil`.
Since the cell nib is defined in a separate package the bundle should be `Bundle.module`, otherwise the app will crash with the exception:

`Fatal error: Unexpectedly found nil while implicitly unwrapping an Optional value`

In the branch `crashFix` a solution to the problem overriding the function `registerViews`
