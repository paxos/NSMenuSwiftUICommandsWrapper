#  NSMenuSwiftUICommandsWrapper

Declare menus once, and use them in SwiftUI (as `.commands`) and AppKit (as `NSMenu`).

Note: This package is currently incomplete.

## Example

Define a menu:
```
let menu = MWNenu(items: [
    .init(action: { print("Hello") }, labelCallback: nil, label: "Hello", keyEquivalent: "e")
    ]
```

Usage in AppKit:
```
class MyBox: NSBox {
    override func menu(for _: NSEvent) -> NSMenu? {
        return menu.toMenu()
    }
}
```

Usage in SwiftUI:
```
.commands {
    menu.toCommands()
}
```


Also make sure to check the demo folder.
