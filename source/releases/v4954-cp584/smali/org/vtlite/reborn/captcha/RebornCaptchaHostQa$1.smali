.class Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa$1;
.super Ljava/lang/Object;
.source "RebornCaptchaHostQa.java"

# interfaces
.implements Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Sink;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEvent(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V
    .registers 5
    .param p1, "event"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    .line 24
    if-nez p1, :cond_3

    return-void

    .line 26
    :cond_3
    :try_start_3
    const-string v0, "VTLiteCaptchaQA"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "E_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1f
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_1f} :catch_22
    .catch Ljava/lang/LinkageError; {:try_start_3 .. :try_end_1f} :catch_20

    goto :goto_23

    .line 28
    :catch_20
    move-exception v0

    goto :goto_23

    .line 27
    :catch_22
    move-exception v0

    .line 28
    :goto_23
    nop

    .line 33
    invoke-static {p1}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->writeFixedEventToHostLog(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 34
    return-void
.end method
