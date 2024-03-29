//
//  ViewModelType.swift
//  Architecture
//
//  Created by Artem Kandaurov on 25/10/2020.
//

import Foundation

public protocol ViewModelType: AnyObject {

    associatedtype Input
    associatedtype Output
    associatedtype Action
    associatedtype Dependency

    var outputs: Output { get }
    var inputs: Input { get }
    var actions: Action { get }
    var dependencies: Dependency { get }

    init(dependencies: Dependency, inputs: Input)
}

public struct ViewModelAssembler<ViewModel: ViewModelType> {

    let dependencies: ViewModel.Dependency

    public init(_ dependencies: ViewModel.Dependency) {
        self.dependencies = dependencies
    }

    func resolve(binding inputs: ViewModel.Input) -> ViewModel {
        return ViewModel(dependencies: dependencies, inputs: inputs)
    }
}
