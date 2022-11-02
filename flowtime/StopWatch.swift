//
// Created by Leonardo Migliorelli on 31/10/22.
//

import Foundation

class StopWatch: ObservableObject {
    private var timer = Timer();
    @Published private var seconds: Int = 0;

    @objc private func update() {
        seconds += 1;
    }

    var duration: TimeInterval {
        TimeInterval(seconds)
    }

    var relaxDuration: TimeInterval {
        TimeInterval(seconds / 5)
    }

    public func stop() {
        timer.invalidate()
    }

    public func reset() {
        seconds = 0
        stop()
    }

    public func start() {
        // riavvia il timer
        stop()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
}