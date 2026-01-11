//
//  SearchService.swift
//  loginApp
//Создаем сервис для генерации триграмм,похожесть ввода слова и товара в каталоге и поиск товара
//  Created by vozzh on 08.01.2026.
//

import Foundation


class SearchService {
    
    /// Создаем  н-граммы из текста
    func generateNGrams(from text: String, n: Int) -> Set<String> {  // ←
        let normalizedText = text.lowercased().trimmingCharacters(in: .whitespaces)
        var ngrams = Set<String>()
        
        guard normalizedText.count >= n else {
            return ngrams
        }
        
        let characters = Array(normalizedText)
        
        for i in 0...(characters.count - n) {
            let ngram = String(characters[i..<(i + n)])
            ngrams.insert(ngram)
        }
        
        return ngrams
    }
    
    /// Поиск товаров по запросу
    func searchProducts(
        _ products: [GoodsModel],
        query: String
    ) -> [GoodsModel] {
        
        let normalizedQuery = query.lowercased().trimmingCharacters(in: .whitespaces)
        
        if normalizedQuery.isEmpty {
            return products
        }
        
        let nGramSize = normalizedQuery.count <= 4 ? 2 : 3
        
        let queryGrams = generateNGrams(from: normalizedQuery, n: nGramSize)
        
        if queryGrams.isEmpty {
            return []
        }
        
        return products
            .map { product in
                let titleGrams = generateNGrams(from: product.title, n: nGramSize)
                let descGrams = generateNGrams(from: product.description, n: nGramSize)
                
                let titleMatches = queryGrams.intersection(titleGrams).count
                let descMatches = queryGrams.intersection(descGrams).count
                
                let matchCount = max(titleMatches, descMatches)
                
                return (product: product, matches: matchCount)
            }
            .filter { $0.matches > 0 }
            .sorted { $0.matches > $1.matches }
            .map { $0.product }
    }
}
