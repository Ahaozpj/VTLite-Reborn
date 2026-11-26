.class public interface abstract Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Completion;
.super Ljava/lang/Object;
.source "RebornCaptchaContextBridge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Completion"
.end annotation


# virtual methods
.method public abstract onCancelledOrUnavailable()V
.end method

.method public abstract onSolved(Ljava/lang/String;)V
.end method
