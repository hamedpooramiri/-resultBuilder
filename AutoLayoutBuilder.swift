//
//  ResultBuilder.swift
//  Quera
//
//  Created by hamedpouramiri on 10/26/23.
//

import Foundation
import AppKit

@resultBuilder
struct AutoLayoutBuilder {
    
    // Input/Output of whole block.
    static func buildBlock(_ components: [NSLayoutConstraint]...) -> [NSLayoutConstraint] {
        return components.flatMap { $0 }
    }

    // Add support for every item type single or collection.
    static func buildExpression(_ expression: NSLayoutConstraint) -> [NSLayoutConstraint] {
        [expression]
    }
    
    static func buildExpression(_ expression: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        expression
    }

    // Add support for optionals.
    static func buildOptional(_ component: [NSLayoutConstraint]?) -> [NSLayoutConstraint] {
        component ?? []
    }

    // Add support for if statements.
    static func buildEither(first component: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        component
    }
    
    static func buildEither(second component: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        component
    }

    // Add support for loops.
    static func buildArray(_ components: [[NSLayoutConstraint]]) -> [NSLayoutConstraint] {
        components.flatMap { $0 }
    }

    // Add support for #availability checks.
    static func buildLimitedAvailability(_ component: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        component
    }

}

extension NSLayoutConstraint {

   /// Activate the layouts defined in the result builder parameter `constraints`.
    static func activate(@AutoLayoutBuilder constraints: () -> [NSLayoutConstraint]) {
       activate(constraints())
   }
}
