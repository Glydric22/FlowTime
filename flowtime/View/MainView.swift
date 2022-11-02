//
//  ContentView.swift
//  flowtime
//
//  Created by Leonardo Migliorelli on 31/10/22.
//
//

import SwiftUI

enum DefaultWindowSize {
    static let width: CGFloat = 350;
    static let height: CGFloat = 250;
}

struct MainView: View {
    @ObservedObject var watch: StopWatch = StopWatch();
    @State var isRunning = false;
    @Binding var relaxingTime: TimeInterval;

    var body: some View {
        GeometryReader { geometry in

            VStack {
//                Text("\(Int(geometry.size.width))x\(Int(geometry.size.height)) \(Int(calcFontTitle(size: geometry.size)))")
                Text("\(watch.duration.minuteSecond)")
                        .font(.system(size: calcFontTitle(size: geometry.size)))
                HStack {
                    isRunning ?
                            Button(action: stop, label: {
                                Image(systemName: "pause.fill")
                                Text("Pause")
                            })
                            :
                            Button(action: start, label: {
                                Image(systemName: "play.fill")
                                Text("Start")
                            })
                    Button(action: reset, label: {
                        Image(systemName: "gobackward")
                        Text("Reset")
                    })
                }
                Button(action: relax) {
                    Image(systemName: "cup.and.saucer.fill")
                    Text("Riposati per \(watch.relaxDuration.minuteSecond)")
                }
            }
                    .padding(8)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
                .frame(minWidth: DefaultWindowSize.width, minHeight: DefaultWindowSize.height)
    }

    func calcFontTitle(size: CGSize) -> CGFloat {
        min(size.width / 4, size.height / 3)
    }

    func relax() {
        relaxingTime = watch.relaxDuration
        reset()
    }

    func reset() {
        watch.reset();
        isRunning = false;
    }

    func stop() {
        watch.stop();
        isRunning = false;
    }

    func start() {
        watch.start();
        isRunning = true;
    }
}