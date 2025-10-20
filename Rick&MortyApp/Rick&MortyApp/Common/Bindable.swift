//
//  Bindable.swift
//  Rick&MortyApp
//
//  Created by André Barros on 20/10/25.
//

class Bindable<T> {
    typealias Listener = (T) -> Void
    
    private var listeners: [Listener] = []
    
    var value: T {
        didSet {
            listeners.forEach { [weak self] listener in
               guard let self else { return }
                listener(self.value)
            }
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ listener: @escaping Listener) {
        listeners.append(listener)
    }
}
