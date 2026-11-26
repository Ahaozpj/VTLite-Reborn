.class Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;
.super Ljava/lang/Object;
.source "RebornCaptchaContextBridge.java"

# interfaces
.implements Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->launch(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;)V
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

    .line 240
    iput-object p1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    iput-object p2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;->val$s:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismissed()V
    .registers 3

    .line 247
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    # getter for: Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->main:Landroid/os/Handler;
    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->access$200(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3$2;

    invoke-direct {v1, p0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3$2;-><init>(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 250
    return-void
.end method

.method public onSolved(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "domain"    # Ljava/lang/String;
    .param p2, "token"    # Ljava/lang/String;

    .line 242
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    # getter for: Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->main:Landroid/os/Handler;
    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->access$200(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3$1;

    invoke-direct {v1, p0, p1, p2}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3$1;-><init>(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 245
    return-void
.end method
