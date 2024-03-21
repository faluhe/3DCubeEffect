//
//  ContentView.swift
//  3DRoatation
//
//  Created by Ismailov Farrukh on 20/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Effect()
    }
}

#Preview {
    ContentView()
}



struct Effect: View {
    let images: [String] = ["1", "4", "3", "5", "6", "7"]

    var body: some View {
        TabView {
            ForEach(images, id: \.self) { img in
                GeometryReader { geometry in

                    Image(img)
                        .resizable()
                        .border(.gray.opacity(0.5))

                        .rotation3DEffect(
                            getAngle(geometry: geometry),
                            axis: (x: 0, y: 1, z: 0),
                            anchor: geometry.frame(in: .global).minX > 0 ? .leading : .trailing,
                            perspective: 3
                        )
                }
            }

        }


        .tabViewStyle(.page(indexDisplayMode: .never))
        .background(.black.opacity(0.8))
    }

    func getAngle(geometry: GeometryProxy) -> Angle {
        let degrees = 45 * (Double(geometry.frame(in: .global).minX) / geometry.size.width)
        return Angle(degrees: degrees)
    }
}
