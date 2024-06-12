// @generated
// This file was automatically generated and should not be edited.

import Apollo

protocol PokeAPI_SelectionSet: Apollo.SelectionSet & Apollo.RootSelectionSet
where Schema == PokeAPI.SchemaMetadata {}

protocol PokeAPI_InlineFragment: Apollo.SelectionSet & Apollo.InlineFragment
where Schema == PokeAPI.SchemaMetadata {}

protocol PokeAPI_MutableSelectionSet: Apollo.MutableRootSelectionSet
where Schema == PokeAPI.SchemaMetadata {}

protocol PokeAPI_MutableInlineFragment: Apollo.MutableSelectionSet & Apollo.InlineFragment
where Schema == PokeAPI.SchemaMetadata {}

extension PokeAPI {
  typealias SelectionSet = PokeAPI_SelectionSet

  typealias InlineFragment = PokeAPI_InlineFragment

  typealias MutableSelectionSet = PokeAPI_MutableSelectionSet

  typealias MutableInlineFragment = PokeAPI_MutableInlineFragment

  enum SchemaMetadata: Apollo.SchemaMetadata {
    static let configuration: Apollo.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> Apollo.Object? {
      switch typename {
      case "query_root": return PokeAPI.Objects.Query_root
      case "pokemon_v2_generation": return PokeAPI.Objects.Pokemon_v2_generation
      case "pokemon_v2_pokemonspecies": return PokeAPI.Objects.Pokemon_v2_pokemonspecies
      case "pokemon_v2_pokemon": return PokeAPI.Objects.Pokemon_v2_pokemon
      case "pokemon_v2_pokemontype": return PokeAPI.Objects.Pokemon_v2_pokemontype
      case "pokemon_v2_type": return PokeAPI.Objects.Pokemon_v2_type
      case "pokemon_v2_evolutionchain": return PokeAPI.Objects.Pokemon_v2_evolutionchain
      case "pokemon_v2_pokemonevolution": return PokeAPI.Objects.Pokemon_v2_pokemonevolution
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}
