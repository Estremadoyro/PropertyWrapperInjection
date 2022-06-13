//
//  Inject.swift
//  PropertyWrapperInjection
//
//  Created by Leonardo  on 12/06/22.
//

import Foundation

protocol Injectable {}

@propertyWrapper
struct Inject<T: Injectable> {
  let wrappedValue: T
  
  init() {
    wrappedValue = Resolver.shared.resolve()
  }
}

/// # Manage storage of the dependencies
/// **Singleton**
final class Resolver {
  private var storage = [String: Injectable]()
  
  static var shared = Resolver()
  private init() {}

  /// # `Add` new dependency
  func add<T: Injectable>(_ injectable: T) {
    // Stringified version of the object's type
    let key = String(reflecting: injectable)
    storage[key] = injectable
  }

  /// # `Resolve` existing stored dependency
  func resolve<T: Injectable>() -> T {
    // Stringified version of the object's type
    let key = String(reflecting: T.self)
    guard let injectable = storage[key] as? T else {
      fatalError("\(key) has not been added as an injectable object yet...")
    }
    return injectable
  }
}
