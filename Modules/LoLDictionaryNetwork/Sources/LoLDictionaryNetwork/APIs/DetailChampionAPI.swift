//
// DetailChampionAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class DetailChampionAPI {

    /**
     detail Champion
     
     - parameter version: (path) version 
     - parameter localization: (path) localization 
     - parameter name: (path) date 
     - returns: ChampionDetailData
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func getChampionDetail(version: String, localization: String, name: String) async throws -> ChampionDetailData {
        return try await getChampionDetailWithRequestBuilder(version: version, localization: localization, name: name).execute().body
    }

    /**
     detail Champion
     - GET /cdn/{version}/data/{localization}/champion/{name}.json
     - parameter version: (path) version 
     - parameter localization: (path) localization 
     - parameter name: (path) date 
     - returns: RequestBuilder<ChampionDetailData> 
     */
    open class func getChampionDetailWithRequestBuilder(version: String, localization: String, name: String) -> RequestBuilder<ChampionDetailData> {
        var localVariablePath = "/cdn/{version}/data/{localization}/champion/{name}.json"
        let versionPreEscape = "\(APIHelper.mapValueToPathItem(version))"
        let versionPostEscape = versionPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{version}", with: versionPostEscape, options: .literal, range: nil)
        let localizationPreEscape = "\(APIHelper.mapValueToPathItem(localization))"
        let localizationPostEscape = localizationPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{localization}", with: localizationPostEscape, options: .literal, range: nil)
        let namePreEscape = "\(APIHelper.mapValueToPathItem(name))"
        let namePostEscape = namePreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{name}", with: namePostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<ChampionDetailData>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }
}
