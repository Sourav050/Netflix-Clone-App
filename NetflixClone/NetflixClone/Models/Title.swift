//
//  Movie.swift
//  NetflixClone
//
//  Created by Sourav Choubey on 02/02/24.
//

import Foundation



struct TrendingTitleResponse : Codable{
    let results : [Title]
}

struct Title : Codable {
    let id: Int
    let media_type : String?
    let original_name : String?
    let original_title : String?
    let poster_path : String?
    let overview : String?
    let vote_count : Int
    let release_date : String?
    let vote_average : Double
    
}



/*
 {
adult = 0;
"backdrop_path" = "/4MCKNAc6AbWjEsM2h9Xc29owo4z.jpg";
"genre_ids" =             (
 28,
 53
);
id = 866398;
"media_type" = movie;
"original_language" = en;
"original_title" = "The Beekeeper";
overview = "One man\U2019s campaign for vengeance takes on national stakes after he is revealed to be a former operative of a powerful and clandestine organization known as Beekeepers.";
popularity = "1268.827";
"poster_path" = "/A7EByudX0eOzlkQ2FIbogzyazm2.jpg";
"release_date" = "2024-01-10";
title = "The Beekeeper";
video = 0;
"vote_average" = "7.324";
"vote_count" = 370;
}
 */
