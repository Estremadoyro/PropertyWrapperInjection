//
//  ViewController.swift
//  PropertyWrapperInjection
//
//  Created by Leonardo  on 12/06/22.
//

import UIKit

final class MainController: UIViewController {
  // MARK: - Dependency Injection
  @Inject var dependency: Dependency1

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Dependency Injection /w PropertyWrapper"
    dependency.doSomething()
  }
}

// MARK: - Dependencies
final class Dependency1: Injectable {
  func doSomething() {
    print("Injection 💉!")
  }
}
