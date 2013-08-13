//
//  InGame.h
//  ForeignJump
//
//  Created by Francis Visoiu Mistrih on 25/07/13.
//  Copyright Epimac 2013. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "GLES-Render.h"
#import "Hero.h"
#import "Ennemi.h"
#import "Background.h"
#import "HUD.h"
#import "Map.h"
#import "ContactListener.h"


//Pixel to metres ratio. Box2D uses metres as the unit for measurement.
//This ratio defines how many pixels correspond to 1 Box2D "metre"
//Box2D is optimized for objects of 1x1 metre therefore it makes sense
//to define the ratio so that your most common object type is 1x1 metre.

// InGame
@interface InGame : CCLayer
{
	GLESDebugDraw *m_debugDraw;		// strong ref
    Hero* hero; //the main hero
    Ennemi* ennemi;
    b2World* world;
    ContactListener *contactListener; //detect coin collision
}

@property (nonatomic, assign) Hero* hero;
@property (nonatomic, assign) Ennemi* ennemi;

// returns a CCScene that contains the InGame as the only child
+(CCScene *) scene;

+(int) getScore;
+(void) scorePlusPlus;
@end