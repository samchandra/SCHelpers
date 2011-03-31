/*
 *  DebugLog.h
 *  Place this file in the application .pch file so that it will be 
 *  available globally.
 *
 *  IMPORTANT: You need to set DEBUG=1 flag in the build setting
 *
 *  Created by Karl Kraft on 3/22/09.
 *  Copyright 2009 Karl Kraft. All rights reserved.
 *
 */

#ifdef DEBUG
    #define SCLog(args...) _DebugLog(__FILE__,__LINE__,__PRETTY_FUNCTION__,args);
#else
    #define SCLog(x...) do{}while(0)
#endif

// The actual debugging function
void _DebugLog(const char *file, int lineNumber, const char *funcName, NSString *format,...);
