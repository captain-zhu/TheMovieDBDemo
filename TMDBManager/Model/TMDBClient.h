//
//  TMDBClient.h
//  TMDBManager
//
//  Created by zhu yongxuan on 15/9/7.
//  Copyright (c) 2015年 zhu yongxuan. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - Constants

struct ConstantsStruct {
    __unsafe_unretained NSString * const ApiKey;
    __unsafe_unretained NSString * const BaseURL;
    __unsafe_unretained NSString * const AuthorizationURL;
};

#pragma mark - Methods

struct MethodsStruct {
    // 关于账号的method
    __unsafe_unretained NSString *Account;
    __unsafe_unretained NSString *AccountIDFavoriteMovie;
    __unsafe_unretained NSString *AccountIDFavorite;
    __unsafe_unretained NSString *AccountIDWatchlistMovie;
    __unsafe_unretained NSString *AccountIDWatchlist;

    // 关于认证的method
    __unsafe_unretained NSString *AuthenticationTokenNew;
    __unsafe_unretained NSString *AuthticationSessionNew;

    // 关于search的method
    __unsafe_unretained NSString *SearchMovie;

    // 关于配置的method
    __unsafe_unretained NSString *Configuration;
};

#pragma mark - URLKeys

struct URLKeysStruct {
    __unsafe_unretained NSString *URLID;
};

#pragma mark  - ParameterKeys

struct ParameterKeysStruct {
    __unsafe_unretained NSString *ApiKey;
    __unsafe_unretained NSString *SessionID;
    __unsafe_unretained NSString *RequestToken;
    __unsafe_unretained NSString *Query;
};

#pragma mark  - JSONBodyKeys

struct JSONBodyKeysStruct {
    __unsafe_unretained NSString *MediaType;
    __unsafe_unretained NSString *MediaID;
    __unsafe_unretained NSString *Favorite;
    __unsafe_unretained NSString *Watchlist;
};

#pragma mark - JSONResponseKeys

struct JSONResponseKeysStruct {
    //General
    __unsafe_unretained NSString *StatusMessage;
    __unsafe_unretained NSString *StatusCode;
    //Authorization
    __unsafe_unretained NSString *RequestToken;
    __unsafe_unretained NSString *SessionID;
    //Account
    __unsafe_unretained NSString *UserID;
    //Config
    __unsafe_unretained NSString *ConfigBaseImageURL;
    __unsafe_unretained NSString *ConfigImages;
    __unsafe_unretained NSString *ConfigPosterSizes;
    __unsafe_unretained NSString *ConfigProfileSizes;
    //Movies
    __unsafe_unretained NSString *MovieID;
    __unsafe_unretained NSString *MovieTitle;
    __unsafe_unretained NSString *MoviePosterPath;
    __unsafe_unretained NSString *MovieReleaseDate;
    __unsafe_unretained NSString *MovieReleaseYear;
    __unsafe_unretained NSString *MovieResults;

};

#pragma mark - PosterSizes

struct PosterSizesStruct {
    __unsafe_unretained NSString *RowPoster;
    __unsafe_unretained NSString *DetailPoster;
};


@interface TMDBClient : NSObject

@property (nonatomic, weak) struct ConstantsStruct Constants;
@property (nonatomic, weak) struct MethodsStruct Methods;
@property (nonatomic, weak) struct URLKeysStruct URLKeys;
@property (nonatomic, weak) struct ParameterKeysStruct ParameterKeys;
@property (nonatomic, weak) struct JSONBodyKeysStruct JSONBodyKeys;
@property (nonatomic, weak) struct JSONResponseKeysStruct JSONResponseKeys;
@property (nonatomic, weak) struct PosterSizesStruct PosterSizes;

+ (TMDBClient *)sharedInstance;
+ (NSString *)escapedParameters:(NSDictionary *)parameters;
+ (NSString *)substituteKeyInMethod:(NSString *)method Target:(NSString *)target withString:(NSString *)string;

@end
