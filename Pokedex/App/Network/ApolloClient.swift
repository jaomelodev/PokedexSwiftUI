//
//  APIClient.swift
//  Pokedex
//
//  Created by João Melo on 25/05/24.
//

import Apollo

let apolloClient = ApolloClient(url: URL(string: "https://beta.pokeapi.co/graphql/v1beta")!)

func callApi() -> Void {
    apolloClient.fetch(query: PokeAPIQueries.getPokemonsByGeneration, )
}
