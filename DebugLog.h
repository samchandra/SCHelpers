/*
 *  DebugLog.h
 *  DebugLog
 *
 *  Created by Karl Kraft on 3/22/09.
 *  Copyright 2009 Karl Kraft. All rights reserved.
 *
 */

// The DEBUG=1 flag need to be set in the build setting
// Place this file in the .pch to make it available globally

#ifdef DEBUG
    #define SCLog(args...) _DebugLog(__FILE__,__LINE__,__PRETTY_FUNCTION__,args);
#else
    #define SCLog(x...) do{}while(0)
#endif

// The actual debugging function
void _DebugLog(const char *file, int lineNumber, const char *funcName, NSString *format,...);
