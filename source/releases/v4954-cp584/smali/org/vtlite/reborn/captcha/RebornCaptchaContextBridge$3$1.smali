.class Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3$1;
.super Ljava/lang/Object;
.source "RebornCaptchaContextBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;->onSolved(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;

.field final synthetic val$domain:Ljava/lang/String;

.field final synthetic val$token:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "this$1"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 242
    iput-object p1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3$1;->this$1:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;

    iput-object p2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3$1;->val$domain:Ljava/lang/String;

    iput-object p3, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3$1;->val$token:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .line 243
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3$1;->this$1:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;

    iget-object v0, v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3$1;->this$1:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;

    iget-object v1, v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;->val$s:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

    iget-object v2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3$1;->val$domain:Ljava/lang/String;

    iget-object v3, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3$1;->val$token:Ljava/lang/String;

    const/4 v4, 0x0

    # invokes: Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->finish(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;Ljava/lang/String;Ljava/lang/String;Z)V
    invoke-static {v0, v1, v2, v3, v4}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->access$000(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method
