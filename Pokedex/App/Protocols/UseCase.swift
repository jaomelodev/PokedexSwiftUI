//
//  UseCaseProtocol.swift
//  Pokedex
//
//  Created by João Melo on 28/05/24.
//

protocol UseCase<ResultUseCase, ParamsUseCase> {
    associatedtype ResultUseCase
    associatedtype ParamsUseCase
    
    func execute(_ params: ParamsUseCase) async throws -> ResultUseCase
}

extension UseCase {
    func callAsFunction(_ params: ParamsUseCase) async throws -> ResultUseCase {
        return try await execute(params)
    }
}
