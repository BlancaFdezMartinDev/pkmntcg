//
//  CardItem.swift
//  pkmntcg
//
//  Created by blanca.a.fernandez on 18/09/2026.
//
import SwiftUI

struct CardItem: View {

    enum Mode {
        case full
        case illustration
    }

    let image: URL?
    let mode: Mode

    var body: some View {
        AsyncImage(url: image) { phase in
            switch phase {

            case .empty:
                ProgressView()

            case .success(let image):
                image
                    .resizable()
                    .modifier(
                        CardImageModifier(mode: mode)
                    )

            case .failure(let error):
                VStack(spacing: 8) {
                    Image(systemName: "photo")
                        .font(.largeTitle)
                }

            @unknown default:
                EmptyView()
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 6))
        .shadow(
            color: .black.opacity(0.5),
            radius: 3,
            x: 0,
            y: 3
        )
    }
}

struct CardImageModifier: ViewModifier {

    let mode: CardItem.Mode

    func body(content: Content) -> some View {

        switch mode {

        case .full:
            content
                .scaledToFit()

        case .illustration:
            content
                .scaledToFill()
                .scaleEffect(1.19)
                .offset(y: 64)
                .frame(height: 110)
                .clipped()
        }
    }
}

#Preview {
  SearchView()
}
