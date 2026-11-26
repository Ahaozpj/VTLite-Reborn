.class Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1;
.super Ljava/lang/Object;
.source "RebornCaptchaBridge.java"

# interfaces
.implements Lcom/vk/id/captcha/api/listener/VKCaptchaResultListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;


# direct methods
.method constructor <init>(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;)V
    .registers 2
    .param p1, "this$1"    # Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;

    .line 123
    iput-object p1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1;->this$1:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResult(Lcom/vk/id/captcha/api/data/VKCaptchaResult;)V
    .registers 4
    .param p1, "result"    # Lcom/vk/id/captcha/api/data/VKCaptchaResult;

    .line 125
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1;->this$1:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;

    iget-object v0, v0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;

    # getter for: Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->activity:Landroid/app/Activity;
    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->access$400(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;)Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1$1;

    invoke-direct {v1, p0, p1}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1$1;-><init>(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1;Lcom/vk/id/captcha/api/data/VKCaptchaResult;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 137
    return-void
.end method
