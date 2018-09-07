/*
################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
*/
#include <stdio.h>
#include <stdlib.h>
#include <jni.h>
#include "czmq.h"
#include "org_zeromq_czmq_Ztrie.h"

JNIEXPORT jlong JNICALL
Java_org_zeromq_czmq_Ztrie__1_1new (JNIEnv *env, jclass c, jchar delimiter)
{
    //  Disable CZMQ signal handling; allow Java to deal with it
    zsys_handler_set (NULL);
    jlong new_ = (jlong) (intptr_t) ztrie_new ((char) delimiter);
    return new_;
}

JNIEXPORT void JNICALL
Java_org_zeromq_czmq_Ztrie__1_1destroy (JNIEnv *env, jclass c, jlong self)
{
    ztrie_destroy ((ztrie_t **) &self);
}

JNIEXPORT jint JNICALL
Java_org_zeromq_czmq_Ztrie__1_1removeRoute (JNIEnv *env, jclass c, jlong self, jstring path)
{
    char *path_ = (char *) (*env)->GetStringUTFChars (env, path, NULL);
    jint remove_route_ = (jint) ztrie_remove_route ((ztrie_t *) (intptr_t) self, path_);
    (*env)->ReleaseStringUTFChars (env, path, path_);
    return remove_route_;
}

JNIEXPORT jboolean JNICALL
Java_org_zeromq_czmq_Ztrie__1_1matches (JNIEnv *env, jclass c, jlong self, jstring path)
{
    char *path_ = (char *) (*env)->GetStringUTFChars (env, path, NULL);
    jboolean matches_ = (jboolean) ztrie_matches ((ztrie_t *) (intptr_t) self, path_);
    (*env)->ReleaseStringUTFChars (env, path, path_);
    return matches_;
}

JNIEXPORT jlong JNICALL
Java_org_zeromq_czmq_Ztrie__1_1hitData (JNIEnv *env, jclass c, jlong self)
{
    jlong hit_data_ = (jlong) (intptr_t) ztrie_hit_data ((ztrie_t *) (intptr_t) self);
    return hit_data_;
}

JNIEXPORT jlong JNICALL
Java_org_zeromq_czmq_Ztrie__1_1hitParameterCount (JNIEnv *env, jclass c, jlong self)
{
    jlong hit_parameter_count_ = (jlong) ztrie_hit_parameter_count ((ztrie_t *) (intptr_t) self);
    return hit_parameter_count_;
}

JNIEXPORT jlong JNICALL
Java_org_zeromq_czmq_Ztrie__1_1hitParameters (JNIEnv *env, jclass c, jlong self)
{
    jlong hit_parameters_ = (jlong) (intptr_t) ztrie_hit_parameters ((ztrie_t *) (intptr_t) self);
    return hit_parameters_;
}

JNIEXPORT jstring JNICALL
Java_org_zeromq_czmq_Ztrie__1_1hitAsteriskMatch (JNIEnv *env, jclass c, jlong self)
{
    char *hit_asterisk_match_ = (char *) ztrie_hit_asterisk_match ((ztrie_t *) (intptr_t) self);
    jstring return_string_ = (*env)->NewStringUTF (env, hit_asterisk_match_);
    return return_string_;
}

JNIEXPORT void JNICALL
Java_org_zeromq_czmq_Ztrie__1_1print (JNIEnv *env, jclass c, jlong self)
{
    ztrie_print ((ztrie_t *) (intptr_t) self);
}

JNIEXPORT void JNICALL
Java_org_zeromq_czmq_Ztrie__1_1test (JNIEnv *env, jclass c, jboolean verbose)
{
    ztrie_test ((bool) verbose);
}
