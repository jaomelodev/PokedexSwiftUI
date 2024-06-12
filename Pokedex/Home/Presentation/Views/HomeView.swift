//
//  HomeView.swift
//  Pokedex
//
//  Created by João Melo on 28/05/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var controller: HomeController = HomeController()
    
    @State private var showBottomSheet = false
    
    var statusBarHeight: CGFloat {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene}
            .first?.windows.first?.windowScene?
            .statusBarManager?.statusBarFrame.height ?? 0
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                LinearGradient(
                    colors: [
                        .vectorPokeball,
                        .textWhite
                    ],
                    startPoint: .center,
                    endPoint: .bottom
                )
                
                .mask {
                    Image("ImagePokeball")
                        .resizable()
                        .frame(
                            maxWidth: geometry.size.width,
                            maxHeight: geometry.size.width
                        )
                }
                .position(
                    x: geometry.size.width / 2,
                    y: -statusBarHeight + 20
                )
            }
            
            ScrollView {
                LazyVStack(alignment: .leading, spacing:0, pinnedViews: [.sectionHeaders]) {
                    HStack (spacing: 20) {
                        Spacer()
                        Button {
                            controller.currentTab = .generations
                            showBottomSheet = true
                        } label: {
                            Image("IconGeneration")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.textBlack)
                                .frame(
                                    width: 25,
                                    height: 25
                                )
                        }
                        Button {
                            controller.currentTab = .sort
                            showBottomSheet = true
                        } label: {
                            Image("IconSort")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.textBlack)
                                .frame(
                                    width: 25,
                                    height: 25
                                )
                        }
                        Button {
                            controller.currentTab = .filter
                            if (controller.filterParemeters != nil) {
                                showBottomSheet = true
                            }
                        } label: {
                            Image("IconFilter")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.textBlack)
                                .frame(
                                    width: 25,
                                    height: 25
                                )
                        }
                    }
                    Text("Pokédex")
                        .font(TextStyles.aplicationTitle)
                        .padding([.top], 35)
                    
                    Text("Search for Pokémon by name or using the National Pokédex number.")
                        .font(TextStyles.description)
                        .foregroundColor(.textGray)
                        .padding([.top], 10)
                    
                    Section {
                        switch controller.pokemonLoading {
                        case .loading:
                            GeometryReader { geometry in
                                ProgressView("Getting you pokemons")
                                    .controlSize(.large)
                                    .position(
                                        x:geometry.size.width/2,
                                        y:150
                                    )
                            }
                        case .failure:
                            Text("Error")
                        case .success:
                            ForEach(controller.pokemonsListFiltered) {pokemon in
                                PokemonListItem(pokemon: pokemon)
                            }
                            .padding([.top], 25)
                        }
                    } header: {
                        PokedexInput(
                            text: $controller.pokemonTextInput,
                            placeHolder: "What Pokémon are you looking for?"
                        )
                        .padding([.top], 44)
                        .padding([.bottom], 15)
                    }
                }
                .padding([.trailing, .leading],40)
                .padding([.top, .bottom], 30)
            }
        }
        .onAppear {
            Task {
                await controller.getPokemonsByGeneration(generationId: 1)
            }
        }
        .sheet(isPresented: $showBottomSheet) {
            switch controller.currentTab {
            case .generations:
                GenerationTab(
                    selectedGeneration: $controller.selectedGeneration
                )
                .presentationDetents([.fraction(0.5), .fraction(0.95)])
                .presentationCornerRadius(30)
                .ignoresSafeArea(.all, edges: .bottom)
            case .sort:
                SortTab(
                    selectedSortType: $controller.selectedSortType
                )
                .presentationDetents([.fraction(0.5), .fraction(0.65)])
                .presentationCornerRadius(30)
                .ignoresSafeArea(.all, edges: .bottom)
            case .filter:
                FilterTab(
                    filterParemeters: controller.filterParemeters!,
                    resetAction: {
                        controller.filterParemeters?.resetFilters()
                    },
                    applyAction: { newParemeters in
                        controller.filterParemeters = newParemeters
                    }
                )
                .presentationDetents([.fraction(0.5), .fraction(1)])
                .presentationCornerRadius(30)
                .ignoresSafeArea(.all, edges: .bottom)
            }
        }
    }
}

#Preview {
    HomeView()
}
