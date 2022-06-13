//
//  DependencyManager.swift
//  PropertyWrapperInjection
//
//  Created by Leonardo  on 12/06/22.
//

import Foundation

final class DependencyManager {
  private let dependency: Dependency1

  init() {
    self.dependency = Dependency1()
    /// # Inject all required dependencies
    addDependencies()
  }

  private func addDependencies() {
    let resolver = Resolver.shared
    resolver.add(dependency)
  }
}
