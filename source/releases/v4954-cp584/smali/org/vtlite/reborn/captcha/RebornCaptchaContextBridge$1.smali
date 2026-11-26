.class Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$1;
.super Ljava/lang/Object;
.source "RebornCaptchaContextBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->begin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Completion;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

.field final synthetic val$s:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;


# direct methods
.method constructor <init>(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;)V
    .registers 3
    .param p1, "this$0"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 219
    iput-object p1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$1;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    iput-object p2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$1;->val$s:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 220
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->CHALLENGE_TIMEOUT:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$1;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$1;->val$s:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

    const/4 v2, 0x0

    const/4 v3, 0x1

    # invokes: Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->finish(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;Ljava/lang/String;Ljava/lang/String;Z)V
    invoke-static {v0, v1, v2, v2, v3}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->access$000(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method
