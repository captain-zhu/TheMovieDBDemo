//
//  TMDBClient.m
//  TMDBManager
//
//  Created by zhu yongxuan on 15/9/7.
//  Copyright (c) 2015年 zhu yongxuan. All rights reserved.
//

#import "TMDBClient.h"

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

    }

    return self;
}

#pragma mark - GET


@end
