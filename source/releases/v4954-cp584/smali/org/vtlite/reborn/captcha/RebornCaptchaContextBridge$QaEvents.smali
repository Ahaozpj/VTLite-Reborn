.class public final Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;
.super Ljava/lang/Object;
.source "RebornCaptchaContextBridge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "QaEvents"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Sink;,
        Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;
    }
.end annotation


# static fields
.field private static volatile sink:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Sink;


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static classify(Lcom/vk/id/captcha/api/data/VKCaptchaResult;)Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;
    .registers 3
    .param p0, "result"    # Lcom/vk/id/captcha/api/data/VKCaptchaResult;

    .line 104
    instance-of v0, p0, Lcom/vk/id/captcha/api/data/VKCaptchaResult$Success;

    if-eqz v0, :cond_7

    .line 105
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->SDK_SUCCESS_CALLBACK:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    return-object v0

    .line 106
    :cond_7
    instance-of v0, p0, Lcom/vk/id/captcha/api/data/VKCaptchaResult$Error;

    if-eqz v0, :cond_31

    .line 107
    move-object v0, p0

    check-cast v0, Lcom/vk/id/captcha/api/data/VKCaptchaResult$Error;

    invoke-virtual {v0}, Lcom/vk/id/captcha/api/data/VKCaptchaResult$Error;->getError()Lcom/vk/id/captcha/api/data/VKCaptchaError;

    move-result-object v0

    .line 108
    .local v0, "kind":Lcom/vk/id/captcha/api/data/VKCaptchaError;
    instance-of v1, v0, Lcom/vk/id/captcha/api/data/VKCaptchaError$Cancelled;

    if-eqz v1, :cond_19

    sget-object v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->SDK_ERROR_CANCELLED:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    return-object v1

    .line 109
    :cond_19
    instance-of v1, v0, Lcom/vk/id/captcha/api/data/VKCaptchaError$NetworkError;

    if-eqz v1, :cond_20

    sget-object v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->SDK_ERROR_NETWORK:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    return-object v1

    .line 110
    :cond_20
    instance-of v1, v0, Lcom/vk/id/captcha/api/data/VKCaptchaError$WebviewIsUpdatingError;

    if-eqz v1, :cond_27

    sget-object v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->SDK_ERROR_WEBVIEW_UPDATING:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    return-object v1

    .line 111
    :cond_27
    instance-of v1, v0, Lcom/vk/id/captcha/api/data/VKCaptchaError$IllegalArgumentError;

    if-eqz v1, :cond_2e

    sget-object v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->SDK_ERROR_BAD_ARGUMENT:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    return-object v1

    .line 112
    :cond_2e
    sget-object v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->SDK_ERROR_OTHER:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    return-object v1

    .line 114
    .end local v0    # "kind":Lcom/vk/id/captcha/api/data/VKCaptchaError;
    :cond_31
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->SDK_UNRECOGNIZED_RESULT:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    return-object v0
.end method

.method public static disable()V
    .registers 1

    .line 98
    const/4 v0, 0x0

    sput-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->sink:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Sink;

    return-void
.end method

.method static emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V
    .registers 3
    .param p0, "event"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    .line 117
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->sink:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Sink;

    .line 118
    .local v0, "active":Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Sink;
    if-eqz v0, :cond_c

    .line 119
    :try_start_4
    invoke-interface {v0, p0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Sink;->onEvent(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_7} :catch_a
    .catch Ljava/lang/LinkageError; {:try_start_4 .. :try_end_7} :catch_8

    .line 121
    :goto_7
    goto :goto_c

    :catch_8
    move-exception v1

    goto :goto_7

    .line 120
    :catch_a
    move-exception v1

    goto :goto_7

    .line 123
    :cond_c
    :goto_c
    return-void
.end method

.method public static installForPrivateQa(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Sink;)V
    .registers 1
    .param p0, "observer"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Sink;

    .line 97
    sput-object p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->sink:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Sink;

    return-void
.end method
