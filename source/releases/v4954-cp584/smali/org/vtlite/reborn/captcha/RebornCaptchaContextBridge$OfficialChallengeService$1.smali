.class Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$OfficialChallengeService$1;
.super Ljava/lang/Object;
.source "RebornCaptchaContextBridge.java"

# interfaces
.implements Lcom/vk/id/captcha/api/listener/VKCaptchaResultListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$OfficialChallengeService;->open(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$OfficialChallengeService;

.field final synthetic val$listener:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeListener;


# direct methods
.method constructor <init>(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$OfficialChallengeService;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeListener;)V
    .registers 3
    .param p1, "this$0"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$OfficialChallengeService;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 145
    iput-object p1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$OfficialChallengeService$1;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$OfficialChallengeService;

    iput-object p2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$OfficialChallengeService$1;->val$listener:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResult(Lcom/vk/id/captcha/api/data/VKCaptchaResult;)V
    .registers 6
    .param p1, "result"    # Lcom/vk/id/captcha/api/data/VKCaptchaResult;

    .line 149
    invoke-static {p1}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->classify(Lcom/vk/id/captcha/api/data/VKCaptchaResult;)Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    move-result-object v0

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 150
    instance-of v0, p1, Lcom/vk/id/captcha/api/data/VKCaptchaResult$Success;

    if-eqz v0, :cond_1c

    .line 151
    move-object v0, p1

    check-cast v0, Lcom/vk/id/captcha/api/data/VKCaptchaResult$Success;

    .line 152
    .local v0, "s":Lcom/vk/id/captcha/api/data/VKCaptchaResult$Success;
    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$OfficialChallengeService$1;->val$listener:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeListener;

    invoke-virtual {v0}, Lcom/vk/id/captcha/api/data/VKCaptchaResult$Success;->getDomain()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/vk/id/captcha/api/data/VKCaptchaResult$Success;->getToken()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeListener;->onSolved(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    .end local v0    # "s":Lcom/vk/id/captcha/api/data/VKCaptchaResult$Success;
    goto :goto_21

    .line 154
    :cond_1c
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$OfficialChallengeService$1;->val$listener:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeListener;

    invoke-interface {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeListener;->onDismissed()V

    .line 156
    :goto_21
    return-void
.end method
