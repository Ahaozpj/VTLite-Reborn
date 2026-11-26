.class Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1$1;
.super Ljava/lang/Object;
.source "RebornCaptchaBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1;->onResult(Lcom/vk/id/captcha/api/data/VKCaptchaResult;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1;

.field final synthetic val$result:Lcom/vk/id/captcha/api/data/VKCaptchaResult;


# direct methods
.method constructor <init>(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1;Lcom/vk/id/captcha/api/data/VKCaptchaResult;)V
    .registers 3
    .param p1, "this$2"    # Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 125
    iput-object p1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1$1;->this$2:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1;

    iput-object p2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1$1;->val$result:Lcom/vk/id/captcha/api/data/VKCaptchaResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 127
    const/4 v0, 0x0

    .line 128
    .local v0, "token":Ljava/lang/String;
    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1$1;->val$result:Lcom/vk/id/captcha/api/data/VKCaptchaResult;

    instance-of v1, v1, Lcom/vk/id/captcha/api/data/VKCaptchaResult$Success;

    if-eqz v1, :cond_21

    .line 129
    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1$1;->val$result:Lcom/vk/id/captcha/api/data/VKCaptchaResult;

    check-cast v1, Lcom/vk/id/captcha/api/data/VKCaptchaResult$Success;

    .line 130
    .local v1, "success":Lcom/vk/id/captcha/api/data/VKCaptchaResult$Success;
    iget-object v2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1$1;->this$2:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1;

    iget-object v2, v2, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1;->this$1:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;

    iget-object v2, v2, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;->val$session:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    iget-object v2, v2, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;->domain:Ljava/lang/String;

    invoke-virtual {v1}, Lcom/vk/id/captcha/api/data/VKCaptchaResult$Success;->getDomain()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_21

    .line 131
    invoke-virtual {v1}, Lcom/vk/id/captcha/api/data/VKCaptchaResult$Success;->getToken()Ljava/lang/String;

    move-result-object v0

    .line 134
    .end local v1    # "success":Lcom/vk/id/captcha/api/data/VKCaptchaResult$Success;
    :cond_21
    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1$1;->this$2:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1;

    iget-object v1, v1, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1;->this$1:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;

    iget-object v1, v1, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;

    iget-object v2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1$1;->this$2:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1;

    iget-object v2, v2, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1;->this$1:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;

    iget-object v2, v2, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;->val$session:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    # invokes: Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->finish(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;Ljava/lang/String;)V
    invoke-static {v1, v2, v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->access$300(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;Ljava/lang/String;)V

    .line 135
    return-void
.end method
