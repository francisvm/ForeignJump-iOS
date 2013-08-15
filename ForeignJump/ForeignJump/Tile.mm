//
//  Tile.m
//  ForeignJump
//
//  Created by Francis Visoiu Mistrih on 27/07/13.
//  Copyright (c) 2013 Epimac. All rights reserved.
//

#import "Tile.h"

@implementation Tile
{
    b2World* world;
}

#pragma mark - synthesize
@synthesize texture;
@synthesize type;
@synthesize position;

#pragma mark - Init method
-(void) initWithSpriteFile:(NSString*)texture_ andType:(TypeCase)type_ atPosition:(CGPoint)position_ andWorld:(b2World*)world_ {

        // Create block and add it to the layer
        texture = [CCSprite spriteWithFile:texture_];
    
        type = type_;
    
        position = position_;
    
        world = world_;
    
    switch (type) {
        case Terre:
        {
            [self createPhysicsTerre];
            texture.tag = 1;
            break;
        }
        case Piece:
        {
            [self createPhysicsCoin];
            texture.tag = 5;
            break;
        }
        case Bombe:
        {
            [self createPhysicsBomb];
            texture.tag = 9;
            break;
        }
            
        default:
        {
            texture.tag = 4;
            break;
        }
    }
}

#pragma mark - Init Physics

-(void) createPhysicsTerre {
    // Create block body
    b2BodyDef blockBodyDef;
    blockBodyDef.type = b2_staticBody;
    blockBodyDef.position.Set(position.x/PTM_RATIO, position.y/PTM_RATIO);
    b2Body *body = world ->CreateBody(&blockBodyDef);
    body->SetUserData(texture);
    
    
    // Create block shape
    b2PolygonShape blockShape;
    blockShape.SetAsBox(12.5/PTM_RATIO,
                        12.5/PTM_RATIO);
    
    // Create shape definition and add to body
    b2FixtureDef blockShapeDef;
    blockShapeDef.shape = &blockShape;
    blockShapeDef.friction = 0.0f;
    blockShapeDef.restitution = 0.01f;
    body->CreateFixture(&blockShapeDef);
}

-(void) createPhysicsCoin {
    //create body
    b2BodyDef spriteBodyDef;
    spriteBodyDef.type = b2_staticBody;
    spriteBodyDef.position.Set(position.x/PTM_RATIO, position.y/PTM_RATIO);
    b2Body *body = world ->CreateBody(&spriteBodyDef);
    body->SetUserData(texture);
    
    //create circular shape
    b2CircleShape spriteShape;
    spriteShape.m_radius = 0.39f;
    
    //create shape definition and add it to the body
    b2FixtureDef spriteShapeDef;
    spriteShapeDef.shape = &spriteShape;
    spriteShapeDef.isSensor = true;
    body->CreateFixture(&spriteShapeDef);
}

-(void) createPhysicsBomb {
    //create body
    b2BodyDef spriteBodyDef;
    spriteBodyDef.type = b2_staticBody;
    spriteBodyDef.position.Set(position.x/PTM_RATIO, position.y/PTM_RATIO);
    b2Body *body = world ->CreateBody(&spriteBodyDef);
    body->SetUserData(texture);
    
    //create circular shape
    b2CircleShape spriteShape;
    spriteShape.m_radius = 0.39f;
    
    //create shape definition and add it to the body
    b2FixtureDef spriteShapeDef;
    spriteShapeDef.shape = &spriteShape;
    spriteShapeDef.isSensor = true;
    body->CreateFixture(&spriteShapeDef);
}


@end
