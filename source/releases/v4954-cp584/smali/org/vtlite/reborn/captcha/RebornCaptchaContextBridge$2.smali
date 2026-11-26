.class Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$2;
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

    .line 222
    iput-object p1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$2;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    iput-object p2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$2;->val$s:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 223
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$2;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$2;->val$s:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

    # invokes: Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->launch(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;)V
    invoke-static {v0, v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->access$100(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;)V

    return-void
.end method
