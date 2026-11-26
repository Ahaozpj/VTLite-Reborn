.class Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3$2;
.super Ljava/lang/Object;
.source "RebornCaptchaContextBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;->onDismissed()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;


# direct methods
.method constructor <init>(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;)V
    .registers 2
    .param p1, "this$1"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;

    .line 247
    iput-object p1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3$2;->this$1:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 248
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3$2;->this$1:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;

    iget-object v0, v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3$2;->this$1:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;

    iget-object v1, v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;->val$s:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

    const/4 v2, 0x0

    const/4 v3, 0x0

    # invokes: Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->finish(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;Ljava/lang/String;Ljava/lang/String;Z)V
    invoke-static {v0, v1, v2, v2, v3}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->access$000(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method
