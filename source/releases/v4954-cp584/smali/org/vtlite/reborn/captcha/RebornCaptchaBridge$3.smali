.class Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$3;
.super Ljava/lang/Object;
.source "RebornCaptchaBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->cancel()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;

.field final synthetic val$cancelled:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;


# direct methods
.method constructor <init>(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;)V
    .registers 3
    .param p1, "this$0"    # Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 195
    iput-object p1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$3;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;

    iput-object p2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$3;->val$cancelled:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 198
    :try_start_0
    sget-object v0, Lcom/vk/id/captcha/api/VKCaptcha;->INSTANCE:Lcom/vk/id/captcha/api/VKCaptcha;

    invoke-virtual {v0}, Lcom/vk/id/captcha/api/VKCaptcha;->closeCaptcha()V
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_5} :catch_6

    .line 201
    goto :goto_7

    .line 199
    :catch_6
    move-exception v0

    .line 202
    :goto_7
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$3;->val$cancelled:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    iget-object v0, v0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;->completion:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Completion;

    invoke-interface {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Completion;->onCancelledOrUnavailable()V

    .line 203
    return-void
.end method
