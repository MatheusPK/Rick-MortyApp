//
//  ViewCodeProtocol.swift
//  Rick&MortyApp
//
//  Created by André Barros on 03/11/25.
//

import UIKit

// MARK: - Protocol Definition

public protocol ViewCode {

    func buildViewHierarchy()

    func setupConstraint()
 
    func setupAdditionalConfiguration()

    func setupView()
}


// MARK: - Default Implementation

/// Default implementation of the setup coordination method.
extension ViewCode {
    public func setupView() {
        buildViewHierarchy()
        setupConstraint()
        setupAdditionalConfiguration()
    }
}

