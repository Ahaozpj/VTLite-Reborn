.class public final Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$OfficialChallengeService;
.super Ljava/lang/Object;
.source "RebornCaptchaContextBridge.java"

# interfaces
.implements Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "OfficialChallengeService"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public close()V
    .registers 2

    .line 159
    sget-object v0, Lcom/vk/id/captcha/api/VKCaptcha;->INSTANCE:Lcom/vk/id/captcha/api/VKCaptcha;

    invoke-virtual {v0}, Lcom/vk/id/captcha/api/VKCaptcha;->closeCaptcha()V

    return-void
.end method

.method public open(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeListener;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "domain"    # Ljava/lang/String;
    .param p3, "uri"    # Ljava/lang/String;
    .param p4, "listener"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeListener;

    .line 144
    sget-object v0, Lcom/vk/id/captcha/api/VKCaptcha;->INSTANCE:Lcom/vk/id/captcha/api/VKCaptcha;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/id/captcha/api/VKCaptcha;->init(Landroid/content/Context;)V

    .line 145
    sget-object v0, Lcom/vk/id/captcha/api/VKCaptcha;->INSTANCE:Lcom/vk/id/captcha/api/VKCaptcha;

    new-instance v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$OfficialChallengeService$1;

    invoke-direct {v1, p0, p4}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$OfficialChallengeService$1;-><init>(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$OfficialChallengeService;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeListener;)V

    invoke-virtual {v0, p2, p3, v1}, Lcom/vk/id/captcha/api/VKCaptcha;->openCaptcha(Ljava/lang/String;Ljava/lang/String;Lcom/vk/id/captcha/api/listener/VKCaptchaResultListener;)V

    .line 158
    return-void
.end method
