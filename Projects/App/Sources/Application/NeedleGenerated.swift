

import Foundation
import HomeFeature
import HomeFeatureInterface
import NeedleFoundation
import UIKit

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class HoemDependency443c4e1871277bd8432aProvider: HoemDependency {


    init() {

    }
}
/// ^->AppComponent->HomeComponent
private func factory270803457ae6983f0152e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return HoemDependency443c4e1871277bd8432aProvider()
}

#else
extension AppComponent: Registration {
    public func registerItems() {


    }
}
extension HomeComponent: Registration {
    public func registerItems() {

    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->AppComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppComponent->HomeComponent", factory270803457ae6983f0152e3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
