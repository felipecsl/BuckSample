import UIKit
import Swift2
import Swift3
import Swift4
import CryptoSwift
import Objc1
import SwiftAndObjc
import SwiftReliesOnCXX
import SwiftWithAssets

public let testVar = "SampleValue"

class ViewController: UIViewController {

  let value = "ViewName"

  override func viewDidLoad() {
    super.viewDidLoad()

    let view = UIView()
    view.frame = self.view.frame
    view.backgroundColor = .gray
    self.view = view

    let label = UILabel()
    label.text = "Main Screen"
    self.view.addSubview(label)
    label.sizeToFit()
    label.center = self.view.center
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    // Swift class defined in Swift2
    let s = MySwiftClass()
    print("Swift2: \(s)")

    // Swift class defined in Swift3. This class is bridged to Objective-C by subclassing `NSObject`
    // and using the `@objc` annotation.
    let c = Counter()
    print("Swift3: \(c)")
    c.increment()

    // From CryptoSwift
    let data = Data(bytes: [0x01, 0x02, 0x03])
    print("Crypto: \(data)")

    // Objective-C class defined in Objc1
    let o = Objc1()
    print("Objc1: %s", o)
    Objc1.sayHello("Michael")

    // Swift class defined in SwiftAndObjc
    MySwiftClassInMixedModule().bestowGreetings("Hello world, how are you?")
    // Objective-C class defined in SwiftAndObjc
    MyObjcClassInMixedModule().sayHello("George")

    // Swift class imports a library with Objective-C++
    MySwiftReliesOnCXXClass().doSomethingWithCXXLibrary()

    // This line will crash if the assets from SwiftWithAssets haven't been bundled into the app
    _ = Catalog.buck.image

    // Without an object explicitly typed as `MyPublicClass`, an instance of `MyPublicClass` won't
    // exhibit conformance to `MyPublicProtocol`. `MyPublicClass` is defined in `Swift4`.
    // `MyPublicProtocol` and the conformance of `MyPublicClass` to `MyPublicProtocol` is defined in
    // `Swift3`.
    //
    // One workaround when possible is to make sure the object is explictly type as `MyPublicClass`
    // and avoid type erasure. You can see this in action by swapping the way that we are creating
    // `myObject` below to to be `MyPublicClass()` instead of `MyFactory.myPublicObject()`.
    //
    // Avoiding type erasure is not always possible though. Another is to annotate `MyPublicClass`
    // with `@objc`. We pass `-ObjC` to "Other Linker Flags", which will cause this conformance to
    // not be stripped.
    //
    // This is tracked by https://bugs.swift.org/browse/SR-6004.
//    let myObject = MyPublicClass()
    let myObject = MyFactory.myPublicObject()
    if (myObject as? MyPublicProtocol) == nil {
      print("Incorrect: `MyPublicProtocol` conformance is being erroneously stripped")
    } else {
      print("Correct: `MyPublicProtocol` conformance is not being stripped")
    }

    print("All good!")
  }
}
