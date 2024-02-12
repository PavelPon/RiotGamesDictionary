//
// DataSummonerAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class DataSummonerAPI {

    /**
     Champions Data List
     
     - parameter version: (path) version 
     - parameter localization: (path) localization 
     - returns: SummonerAllData
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func getDataSummoners(version: String, localization: String) async throws -> SummonerAllData {
        return try await getDataSummonersWithRequestBuilder(version: version, localization: localization).execute().body
    }

    /**
     Champions Data List
     - GET /cdn/{version}/data/{localization}/summoner.json
     - parameter version: (path) version 
     - parameter localization: (path) localization 
     - returns: RequestBuilder<SummonerAllData> 
     */
    open class func getDataSummonersWithRequestBuilder(version: String, localization: String) -> RequestBuilder<SummonerAllData> {
        var localVariablePath = "/cdn/{version}/data/{localization}/summoner.json"
        let versionPreEscape = "\(APIHelper.mapValueToPathItem(version))"
        let versionPostEscape = versionPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{version}", with: versionPostEscape, options: .literal, range: nil)
        let localizationPreEscape = "\(APIHelper.mapValueToPathItem(localization))"
        let localizationPostEscape = localizationPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{localization}", with: localizationPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<SummonerAllData>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }
}