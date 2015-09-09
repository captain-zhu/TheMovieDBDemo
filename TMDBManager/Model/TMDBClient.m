//
//  TMDBClient.m
//  TMDBManager
//
//  Created by zhu yongxuan on 15/9/7.
//  Copyright (c) 2015年 zhu yongxuan. All rights reserved.
//

#import "TMDBClient.h"
#import <AppKit>

@implementation TMDBClient {
    //shared session
    NSURLSession *_session;

    //认证状态
    NSString *_sessionID;
    NSInteger _userID;
}

#pragma mark - LifeCycle

//重载init函数，在init时同时获得session
- (instancetype)init {
    if ((self = [super init])) {
        _session = [NSURLSession sharedSession];

        // 初始化constants
        self.Constants = {
                .ApiKey = @"e45fa92c3312d2f9c219559e40b583c3",
                .BaseURL = @"https://api.themoviedb.org/3/",
                .AuthorizationURL = @"https://www.themoviedb.org/authenticate/"
        };

        // 初始化methods
        self.Methods = {
                .Account = @"account",
                .AccountIDFavoriteMovie = @"account/{id}/favorite/movies",
                .AccountIDFavorite = @"account/{id}/favorite",
                .AccountIDWatchlistMovie = @"account/{id}/watchlist/movies",
                .AccountIDWatchlist = @"account/{id}/watchlist",
                .AuthenticationTokenNew = @"authentication/token/new",
                .AuthticationSessionNew = @"authentication/session/new",
                .SearchMovie = @"search/movie",
                .Configuration = @"configuration";
        };

        // 初始化URLKeys
        self.URLKeys = {
                .URLID = @"id"
        };

        //初始化parameterKeys
        self.ParameterKeys = {
                .ApiKey = @"api_key",
                .SessionID = @"session_id",
                .RequestToken = @"request_token",
                .Query = @"query"
        };


        // 初始化JSONBodyKeys
        self.JSONBodyKeys = {
                .MediaType = @"media_type",
                .MediaID = @"media_id",
                .Favorite = @"favorite",
                .Watchlist = @"watchlist"
        };

        // 初始化JSONResponseKeys
        self.JSONResponseKeys = {
                // General
                .StatusMessage = @"status_message",
                .StatusCode = @"status_code",

                // Authorization
                .RequestToken = @"request_token",
                .SessionID = @"session_id",

                // Account
                .UserID = @"id",

                // MARK: Config
                .ConfigBaseImageURL = @"secure_base_url",
                .ConfigImages = @"images",
                .ConfigPosterSizes = @"poster_sizes",
                .ConfigProfileSizes = @"profile_sizes",

                // MARK: Movies
                .MovieID = @"id",
                .MovieTitle = @"title",
                .MoviePosterPath = @"poster_path",
                .MovieReleaseDate = @"release_date",
                .MovieReleaseYear = @"release_year",
                .MovieResults = @"results"

        };

        // 初始化PosterSizes
        self.PosterSizes = {
                .RowPoster = [TMDBClient sharedInstance].config.posterSizes[2],
                .DetailPoster = [TMDBClient sharedInstance].config.posterSizes[4]
        };

    }

    return self;
}


#pragma mark - Helper Function

/* Help function. Given a raw JSON, return a usable Foundation object*/

/* Help function. substitute the key in method
 * */
+ (NSString *)substituteKeyInMethod:(NSString *)method Target:(NSString *)target withString:(NSString *)string
{
    if ([method rangeOfString:[NSString stringWithFormat:@"{%@}", target]].location != NSNotFound) {
        return [method stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"{%@}", target]
                                                 withString:string];
    } else {
        return nil;
    }
}



//+ (void)parseJSONWithCompletionHandler:(NSData *)data withCompletionHandler:(void (^)(id result, NSError *error))handler)
//{
//    NSError *parsingError = nil;
//    id parsedResult =
//}

/* Helper Function. Given a dictionary of parameters, convert to a string for url
 * */
+ (NSString *)escapedParameters:(NSDictionary *)parameters
{
    NSMutableArray *urlValue = [[NSMutableArray alloc] init];

    for (NSString *key in parameters) {

        if ([parameters[key] isKindOfClass:[NSString class]]) {
            NSString *escapedString = [parameters[key]
                    stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            NSString *string = [NSString stringWithFormat:@"%@=%@",key,escapedString];
            [urlValue addObject:string];
        }
    }

    if (!urlValue || !urlValue.count) {
        NSString *joinedString = [urlValue componentsJoinedByString:@"&"];
        return joinedString;
    } else {
        return @"?";
    }
}


#pragma mark - Shared Instance

+ (TMDBClient *)sharedInstance
{

    static TMDBClient *sharedInstance = nil;
    static dispatch_once_t once_t;
    dispatch_once(&once_t, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;

}




@end
