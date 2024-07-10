//
//  PokemonPage.swift
//  Pokedex
//
//  Created by João Melo on 15/06/24.
//

import SwiftUI

enum PokemonTab: String, CaseIterable, Identifiable {
    case about = "About"
    case stats = "Stats"
    case evolution = "Evolution"
    
    var id: PokemonTab { self }
}

struct PokemonPage: View {
    let pokemon: PokemonEntity
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isBootomSheetOpen = true
    @State private var sheetHeight: CGFloat = 0.0
    @State private var sheetScrollProgress: CGFloat = 0.0;
    @State private var pokemonNameTargetedXOffset: CGFloat = 0.0
    @State private var selectedTab: PokemonTab = .about
    
    private var minBottomSheetDetent: CGFloat
    private var maxBottomSheetDetent: CGFloat
    
    var backgroundColor: Color {
        getPokemonBackgroundColor(pokemon.types.first!)
    }
    
    init (pokemon: PokemonEntity) {
        self.pokemon = pokemon
        minBottomSheetDetent = UIScreen.main.bounds.height - 315
        maxBottomSheetDetent = UIScreen.main.bounds.height - 155
        
        if let window = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first?.windows
            .first {
                minBottomSheetDetent -= window.safeAreaInsets.top
                maxBottomSheetDetent -= window.safeAreaInsets.top
            }
    }
    
    var body: some View {
        GeometryReader { geometryParent in
            ZStack {
                Color(backgroundColor)
                    .ignoresSafeArea()
                
                VStack {
                    GeometryReader { geometry in
                        ZStack {
                            Color.clear
                                .ignoresSafeArea()
                            
                            HStack {
                                Spacer()
                                StrokeText(
                                    text: pokemon.name.uppercased(),
                                    width: 2,
                                    color: backgroundColor,
                                    font: TextStyles.title
                                )
                                .lineLimit(1)
                                .fixedSize(horizontal: true, vertical: false)
                                Spacer()
                            }
                            .frame(width: geometry.size.width)
                            .offset(y: -62)
                            .opacity(1.0 - (sheetScrollProgress * 2.2))
                            
                            LinearGradient(
                                colors: [
                                     .textWhite.opacity(0.3),
                                     .textWhite.opacity(0)
                                ],
                                startPoint: .topTrailing,
                                endPoint: .bottomLeading
                            )
                            .mask {
                                Image("Image5x10")
                                    .resizable()
                                    .frame(maxWidth: 140, maxHeight: 65 )
                                    .position(
                                        x: geometry.size.width - 2,
                                        y: (geometry.safeAreaInsets.top - 19) +
                                            ((geometry.size.height * 0.75) - ((geometry.size.height * 0.75) * sheetScrollProgress))
                                    )
                            }
                                
                            self.PokemonCard(geometry: geometry)
                                .animation(.bouncy, value: sheetScrollProgress)
                                
                        }
                        .ignoresSafeArea()
                    }
                    
                    HStack {
                        ForEach(PokemonTab.allCases.indices, id: \.self) { index in
                            let pokemonTab = PokemonTab.allCases[index]

                            PokemonTabButton(
                                label: pokemonTab.rawValue,
                                action: {
                                    selectedTab = pokemonTab
                                },
                                isSelected: selectedTab == pokemonTab
                            )

                            if index != PokemonTab.allCases.indices.last {
                                Spacer()
                            }
                        }
                    }
                    .animation(.smooth(duration: 0.3), value: sheetScrollProgress)
                    .padding([.horizontal], 20)
                    .offset(y: -50)
                   
                    Spacer()
                        .frame(height: sheetHeight - 100)
                }
                
            }
            .sheet(isPresented: $isBootomSheetOpen) {
                BodySheet(
                    sheetSize: $sheetHeight,
                    sheetScrollProgress: $sheetScrollProgress,
                    pokemon: pokemon,
                    minBottomSheetDetent: minBottomSheetDetent,
                    pokemonTab: selectedTab
                )
                .interactiveDismissDisabled(true)
                .presentationDetents([
                    .height(minBottomSheetDetent),
                    .height(maxBottomSheetDetent),
                ])
                .presentationCornerRadius(30)
                .presentationDragIndicator(.hidden)
                .presentationBackgroundInteraction(.enabled)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.textWhite)
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func PokemonCard(geometry: GeometryProxy) -> some View {
        HStack(spacing: 0) {
            ZStack {
                LinearGradient(
                    gradient: Gradient(
                        stops: [
                            Gradient.Stop(
                                color: .textWhite.opacity(0.35),
                                location: 0
                            ),
                            Gradient.Stop(
                                color:  .textWhite.opacity(0),
                                location: 0.35
                            ),
                        ]
                    ),
                    
                    startPoint: .bottom,
                    endPoint: .topLeading
                )
                .mask {
                    Image("ImageCircle")
                        .resizable()
                        .frame(
                            width: 125,
                            height: 125
                        )
                }
                .frame(width: 125)
                
                AsyncImage(url: URL(string: pokemon.pokemonImageUrl)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(maxWidth: 125, maxHeight: 125)
                    case .failure:
                        Image(systemName: "exclamationmark.warninglight")
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            .opacity(1.0 - (sheetScrollProgress * 2.2))
            
            
            VStack (alignment: .leading, spacing: 0) {
                Text("#" + String(pokemon.id)
                    .padStart(
                        toLength: 3,
                        withPad: "0"
                    )
                )
                .font(TextStyles.pokemonNumber)
                .foregroundColor(.textNumber)
                .opacity(1.0 - (sheetScrollProgress * 2.2))
                
                
                Text(pokemon.nameCapitalized)
                    .font(TextStyles.pokemonName)
                    .foregroundColor(.textWhite)
                    .background(
                        GeometryReader { nameGeo -> Color in
                            DispatchQueue.main.async {
                                if (pokemonNameTargetedXOffset == 0.0) {
                                    let initialPosition = nameGeo.frame(in: .global).origin
                             
                                    let targetPosition = CGPoint(
                                        x: geometry.frame(in: .global).midX - nameGeo.size.width / 2,
                                        y: 0
                                    )
                                    
                                    pokemonNameTargetedXOffset = targetPosition.x - initialPosition.x
                                }
                            }
                            
                            return Color.clear
                        }
                    )
                    .offset(
                        x: pokemonNameTargetedXOffset * sheetScrollProgress,
                        y: -6 * sheetScrollProgress
                    )
                

                HStack {
                    ForEach(pokemon.types) { type in
                        PokedexPokemonBadge(pokemonType: type)
                    }
                }
                .padding([.top], 5)
                .opacity(1.0 - (sheetScrollProgress * 2.2))
            }
            .padding([.leading], 25)
        }
        .frame(height: 125)
    }
    
    struct BodySheet: View {
        @Binding var sheetSize: CGFloat
        @Binding var sheetScrollProgress: CGFloat;
        
        let pokemon: PokemonEntity
        let minBottomSheetDetent: CGFloat
        let pokemonTab: PokemonTab
        
        var body: some View {
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    switch pokemonTab {
                    case .about:
                        PokemonAboutTab(
                            pokemon: pokemon
                        )
                    case .stats:
                        PokemonStatsTab(
                            pokemon: pokemon
                        )
                    case .evolution:
                        PokemonEvolutionTab(
                            pokemon: pokemon
                        )
                    }
                }
                .animation(.bouncy, value: pokemonTab)
                .onAppear {
                    sheetSize = geometry.size.height
                }
                .onChange(of: geometry.size.height) {
                    sheetSize = geometry.size.height
                    sheetScrollProgress = (geometry.size.height - minBottomSheetDetent) / 160
                }
            }
        }
    }
}

#Preview {
    PokemonPage(
        pokemon: PokemonEntity(
            id: 1,
            name: "Bulbasaur",
            description: "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun's rays, the seed grows progressively larger.",
            height: 7,
            weight: 69,
            catchRate: 45,
            baseHappiness: 50,
            growthRate: "medium-slow",
            baseExp: 64,
            genderRate: 6,
            eggCycles: 20,
            eggGroups: ["monster", "grass"],
            types: [.grass, .poison],
            evolutionChain: [],
            pokemonStats: [],
            pokemonAbilities: [
                PokemonAbilityEntity(name: "overgrow", isHidden: false),
                PokemonAbilityEntity(name: "chlorophyll", isHidden: true)
            ]
        )
    )
}
