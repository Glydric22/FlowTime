//
// Created by Leonardo Migliorelli on 31/10/22.
//

import Foundation

class StopWatch: ObservableObject {
    private var timer = Timer();

    @Published private(set) var seconds: Int = 0;
    var duration: TimeInterval {
        TimeInterval(seconds)
    }
    var relaxDuration: TimeInterval {
        TimeInterval(seconds / 5)
    }

    @objc private func update() {
        seconds += 1;
    }

    public func reset() {
        seconds = 0
        stop()
    }

    public func stop() {
        timer.invalidate()
    }

    public func start() {
        stop()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
}