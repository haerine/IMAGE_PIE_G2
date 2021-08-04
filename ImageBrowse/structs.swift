//
//  struct.swift
//  guru2
//
//  Created by 이혜린 on 2021/08/03.
//

struct Meta:Codable{
    let meta:[Response]?
    let total_count:Int
    let pageable_count:Int
    let is_end:Bool
}

struct Document:Codable{
    let Document:[Response]?
    let collection:String
    let thumbnail_url:String
    let image_url:String
    let width:Int
    let height:Int
    let display_sitename:String
    let doc_url:String
    let datetime:String
}

struct Response:Codable{
    let meta:Meta
    let Document: Document

}
