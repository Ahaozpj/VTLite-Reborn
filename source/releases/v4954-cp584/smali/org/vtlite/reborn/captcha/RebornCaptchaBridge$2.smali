.class Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;
.super Ljava/lang/Object;
.source "RebornCaptchaBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->begin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Completion;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;

.field final synthetic val$session:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;


# direct methods
.method constructor <init>(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;)V
    .registers 3
    .param p1, "this$0"    # Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 110
    iput-object p1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;

    iput-object p2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;->val$session:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .line 112
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;

    monitor-enter v0

    .line 113
    :try_start_3
    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;

    # getter for: Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->pending:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;
    invoke-static {v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->access$100(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;)Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    move-result-object v1

    iget-object v2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;->val$session:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    if-eq v1, v2, :cond_f

    monitor-exit v0

    return-void

    .line 114
    :cond_f
    monitor-exit v0
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_58

    .line 115
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;

    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;->val$session:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    # invokes: Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->isCurrentSafe(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;)Z
    invoke-static {v0, v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->access$200(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_23

    .line 116
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;

    iget-object v2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;->val$session:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    # invokes: Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->finish(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;Ljava/lang/String;)V
    invoke-static {v0, v2, v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->access$300(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;Ljava/lang/String;)V

    .line 117
    return-void

    .line 120
    :cond_23
    :try_start_23
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;

    # getter for: Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->activity:Landroid/app/Activity;
    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->access$400(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 121
    .local v0, "appContext":Landroid/content/Context;
    sget-object v2, Lcom/vk/id/captcha/api/VKCaptcha;->INSTANCE:Lcom/vk/id/captcha/api/VKCaptcha;

    invoke-virtual {v2, v0}, Lcom/vk/id/captcha/api/VKCaptcha;->init(Landroid/content/Context;)V

    .line 122
    sget-object v2, Lcom/vk/id/captcha/api/VKCaptcha;->INSTANCE:Lcom/vk/id/captcha/api/VKCaptcha;

    iget-object v3, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;->val$session:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    iget-object v3, v3, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;->domain:Ljava/lang/String;

    iget-object v4, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;->val$session:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    iget-object v4, v4, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;->redirectUri:Ljava/lang/String;

    new-instance v5, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1;

    invoke-direct {v5, p0}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2$1;-><init>(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;)V

    invoke-virtual {v2, v3, v4, v5}, Lcom/vk/id/captcha/api/VKCaptcha;->openCaptcha(Ljava/lang/String;Ljava/lang/String;Lcom/vk/id/captcha/api/listener/VKCaptchaResultListener;)V
    :try_end_44
    .catch Ljava/lang/RuntimeException; {:try_start_23 .. :try_end_44} :catch_4e
    .catch Ljava/lang/LinkageError; {:try_start_23 .. :try_end_44} :catch_45

    .end local v0    # "appContext":Landroid/content/Context;
    goto :goto_56

    .line 141
    :catch_45
    move-exception v0

    .line 143
    .local v0, "ignored":Ljava/lang/LinkageError;
    iget-object v2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;

    iget-object v3, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;->val$session:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    # invokes: Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->finish(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;Ljava/lang/String;)V
    invoke-static {v2, v3, v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->access$300(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;Ljava/lang/String;)V

    goto :goto_57

    .line 139
    .end local v0    # "ignored":Ljava/lang/LinkageError;
    :catch_4e
    move-exception v0

    .line 140
    .local v0, "ignored":Ljava/lang/RuntimeException;
    iget-object v2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;

    iget-object v3, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;->val$session:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    # invokes: Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->finish(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;Ljava/lang/String;)V
    invoke-static {v2, v3, v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->access$300(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;Ljava/lang/String;)V

    .line 144
    .end local v0    # "ignored":Ljava/lang/RuntimeException;
    :goto_56
    nop

    .line 145
    :goto_57
    return-void

    .line 114
    :catchall_58
    move-exception v1

    :try_start_59
    monitor-exit v0
    :try_end_5a
    .catchall {:try_start_59 .. :try_end_5a} :catchall_58

    throw v1
.end method
